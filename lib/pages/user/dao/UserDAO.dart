
import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../model/UserModel.dart';
import '../controller/Database.dart';

class UserDAO {
  late DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('User');
  DataBase db = DataBase();

  UserDAO(){
    _userRef = db.db.ref().child('User');
  }

  void saveUser(UserModel user){
    _userRef = db.db.ref().child('User/'+user.userID.toString());
    _userRef.set(user.toJson());

    // save likedProjects
    user.userLikedProject.forEach((elt) {
      var ref = db.db.ref().child('User/'+user.userID.toString()+'/userLikedProject/'+elt.projectID.toString());
      ref.set( elt.toJson());
    });
  }

  Query getUserQuery() {
    return _userRef;
  }

  Future<UserModel> getUserByID(int id)  async {
    //getting the user without the list liked projects :
    final userSnapshot = await FirebaseDatabase.instance.ref().child('User/'+ id.toString()).get();
    final json = userSnapshot.value as Map<dynamic, dynamic>;
    UserModel userOBJ = UserModel.fromJson(json);

    //retreiving the user's  liked projects :
    final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
       likedProjectsSnopshot.children.forEach((project)
        {
          var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
          userOBJ.userLikedProject.add(projectOBJ);
        });

    return userOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
  }

  Future<List<UserModel>> getListOfUsers() async {
   // 2-step process :

    // first : retreiving the users without liked projects
    List<UserModel> list = <UserModel>[];
    final usersSnapshot = await FirebaseDatabase.instance.ref().child('User').get();
    usersSnapshot.children.forEach((user) async {
      var userOBJ = UserModel.fromJson(user.value as Map<dynamic, dynamic>);
      list.add(userOBJ);
    });

    // second : retreiving the user's  liked projects :
    for(int i =0; i<list.length;i++) {
          int id = list[i].userID;
          list[i].userLikedProject= <ProjectModel>[];
          final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
                likedProjectsSnopshot.children.forEach((project) {
                var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
                list[i].userLikedProject.add(projectOBJ);
                });
    }
    return list;
  }

  Future<List<ProjectModel>> getUserLikedProjectsByUserId(int id) async {

    // retreiving the users liked projects
    List<ProjectModel> list = <ProjectModel>[];
    final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
          likedProjectsSnopshot.children.forEach((project)
          {
            var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
            list.add(projectOBJ);
          });

    return list;
  }

  Future<void> addProjectToUserLikedProjects(UserModel user, ProjectModel project) async {
    var ref = db.db.ref().child('User/'+user.userID.toString()+'/userLikedProject/'+project.projectID.toString());
    ref.set( project.toJson());
    user.userLikedProject.add(project);
  }
}