import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';

import '../user/controller/Database.dart';
import '../MODEL/UserModel.dart';

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

  /// Gets a user from the database with his email and his password.
  /// This function is used for the connexion.
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

  /// Sets the total distance of the user.
  /// It is used when the user has finished an activity.
  setKilometersUser(UserModel user, double km) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userTotalDistance" : (km).toString(),
    });
  }

  /// Sets the total donations of the user.
  /// It is used when the user have done a donation to a project.
  addOneDonationUser(UserModel user) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userTotalDonations" : (user.userTotalDonations + 1).toString(),
    });
  }

  /// Sets the purse of the user.
  /// It is called when the user made a donation and when the user has made an activity and won some money.
  setPurseUser(UserModel user, double amount) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/' + user.userID.toString()).update({
      "userPurse" : (amount).toString(),
    });
  }

  /// Add a user to the database.
  addUser(UserModel user) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('User/').push();
    user.userID = newRef.key!;
    newRef.set(user.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }

  /// Gets a user with his ID.
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

  /// Delete a user in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
  }

  /// Update the user in the database.
  /// It is called when the user made some changes in his information in the profile.
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

  /// Gets the list of all users.
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

  /// Get the list of faovrite projects of one user with his ID.
  Future<List<ProjectModel>> getUserLikedProjectsByUserId(String id) async {

    // retrieving the users liked projects
    List<ProjectModel> list = <ProjectModel>[];
    final likedProjectsSnopshot =  await FirebaseDatabase.instance.ref().child('User/'+ id.toString()+'/userLikedProject').get();
          for (var project in likedProjectsSnopshot.children) {
            var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
            list.add(projectOBJ);
          }

    return list;
  }

  /// Add a project to the favorite projects of the user.
  Future<void> addProjectToUserLikedProjects(UserModel user, ProjectModel project) async {
    var ref = db.db.ref().child('User/' + user.userID.toString() + '/userLikedProject/' + project.projectID.toString());
    ref.set(project.toJson());
    user.userLikedProject.add(project);
  }

  /// Remove a projects in the favorite projects of the user.
  Future<void> removeProjectToUserLikedProjects(UserModel user, ProjectModel project) async {
    db.db.ref().child('User/' + user.userID.toString() + '/userLikedProject/' + project.projectID.toString()).remove();
    user.userLikedProject.remove(project);
  }
}