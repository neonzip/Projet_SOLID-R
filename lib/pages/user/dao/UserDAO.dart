
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../model/UserModel.dart';
import '../controller/Database.dart';

class UserDAO {
  late DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('User');
  DataBase db = DataBase();
  List<UserModel> list = <UserModel>[];
  UserDAO(){
    _userRef = db.db.ref().child('User');
    List<UserModel> list = <UserModel>[];
  }

  void saveUser(UserModel user){
    _userRef = db.db.ref().child('User/'+user.userID.toString());
    _userRef.set(user.toJson());
    // save likedProjects

    user.userLikedProject.forEach((elt) {
      var ref = db.db.ref().child('User/'+user.userID.toString()+'/userLikedProject/'+elt.projectID.toString());
      ref.set( elt.toJson());});
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }

  UserModel? getUserByID(int id)  {
    var ref =  FirebaseDatabase.instance.ref('User/'+ id.toString() );

      ref.once().then((DatabaseEvent event){
        final json = event.snapshot.value as Map<dynamic, dynamic>;
        UserModel userOBJ = UserModel.fromJson(json);

          var ssref =  FirebaseDatabase.instance.ref('User/'+ id.toString()+'/userLikedProject' );

             ssref.once().then((DatabaseEvent e) {
                       e.snapshot.children.forEach((project) {
                          var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
                          userOBJ.userLikedProject.add(projectOBJ);
                        });
              });

        return userOBJ;
       });
     return null;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
  }

  List<UserModel> getListOfUsers() {

    final ref = FirebaseDatabase.instance.ref('User');
    ref.once().then((DatabaseEvent event) {
          event.snapshot.children.forEach((user) {
            //getting the user
            var userOBJ = UserModel.fromJson(user.value as Map<dynamic, dynamic>);
            // getting all the liked projects of this user
                  int id = userOBJ.userID;
                  var ssref = FirebaseDatabase.instance.ref('User/' + id.toString() + '/userLikedProject');
                      ssref.once().then((DatabaseEvent e) {
                           e.snapshot.children.forEach((project) {
                               var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
                               userOBJ.userLikedProject.add(projectOBJ);
                           });
                      });
                      list.add(userOBJ);
          });

          return list;
    });
    print("sm");
    return list;
  }


}