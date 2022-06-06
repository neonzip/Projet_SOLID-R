import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../model/UserModel.dart';
import '../controller/Database.dart';

class UserDAO {
  /// This is the user who will be able to signin.
  late UserModel userModel;


  late DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('User');
  DataBase db = DataBase();

  UserDAO(){
    _userRef = db.db.ref().child('User');
  }

  void saveUser(UserModel user){
    _userRef = db.db.ref().child('User/'+user.userID.toString());
    _userRef.set(user.toJson());

    // save likedProjects
    for (var elt in user.userLikedProject) {
      var ref = db.db.ref().child('User/'+user.userID.toString()+'/userLikedProject/'+elt.projectID.toString());
      ref.set( elt.toJson());
    }
  }

  Future<UserModel> getUserFromDatabase(String mail, String password) async {
    List<UserModel> users = await getListOfUsers();

    for (var user in users) {
      if ((user.userEmail == mail) && (user.password == password)) {

        userModel = user;
        break;
      }
      else {
        userModel = UserModel("", "", "", "", false);     // To initialize userModel and avoid some error.
      }
    }
    return userModel;
  }

  setKilometersUser(UserModel user, double km) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userTotalDistance" : (km).toString(),
    });
  }

  addOneDonationUser(UserModel user) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userTotalDonations" : (user.userTotalDonations + 1).toString(),
    });
  }


  setPurseUser(UserModel user, double amount) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userPurse" : (amount).toString(),
    });
  }

  addUser(UserModel user) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('User/').push();
    user.userID = newRef.key!;
    newRef.set(user.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }

  Future<UserModel> getUserByID(String id)  async {
    //getting the user without the list liked projects :
    final userSnapshot = await FirebaseDatabase.instance.ref().child('User/'+ id.toString()).get();
    final json = userSnapshot.value as Map<dynamic, dynamic>;
    UserModel userOBJ = UserModel.fromJson(json);

    //retreiving the user's  liked projects :
    final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
       for (var project in likedProjectsSnopshot.children) {
          var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
          userOBJ.userLikedProject.add(projectOBJ);
        }

    return userOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
  }

  updateUser(UserModel user) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update(
        {
          "userNickName" : user.userNickName,
          "userEmail" : user.userEmail,
          "password" : user.password,
        }
        );
  }

  Future<List<UserModel>> getListOfUsers() async {
   // 2-step process :

    // first : retrieving the users without liked projects
    List<UserModel> list = <UserModel>[];
    final usersSnapshot = await FirebaseDatabase.instance.ref().child('User').get();
    for (var user in usersSnapshot.children) {
      var userOBJ = UserModel.fromJson(user.value as Map<dynamic, dynamic>);
      list.add(userOBJ);
    }

    // second : retrieving the user's  liked projects :
    for(int i =0; i<list.length;i++) {
          String id = list[i].userID;
          list[i].userLikedProject= <ProjectModel>[];
          final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
                for (var project in likedProjectsSnopshot.children) {
                var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
                list[i].userLikedProject.add(projectOBJ);
                }
    }
    return list;
  }

  Future<List<ProjectModel>> getUserLikedProjectsByUserId(String id) async {

    // retreiving the users liked projects
    List<ProjectModel> list = <ProjectModel>[];
    final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
          for (var project in likedProjectsSnopshot.children) {
            var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
            list.add(projectOBJ);
          }

    return list;
  }

  Future<void> addProjectToUserLikedProjects(UserModel user, ProjectModel project) async {
    var ref = db.db.ref().child('User/'+user.userID.toString()+'/userLikedProject/'+project.projectID.toString());
    ref.set( project.toJson());
    user.userLikedProject.add(project);
  }
}