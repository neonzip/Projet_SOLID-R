
import 'dart:convert';

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
      ref.set( elt.toJson());});
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }

  UserModel? getUserByID(int id)  {
    var ref =  FirebaseDatabase.instance.ref('User/'+ id.toString() );
    var userOBJ=null;
     ref.once().then((DatabaseEvent event){
        final json = event.snapshot.value as Map<dynamic, dynamic>;
         userOBJ = UserModel.fromJson(json);
          var ssref =  FirebaseDatabase.instance.ref('User/'+ id.toString()+'/userLikedProject' );

             ssref.once().then((DatabaseEvent e) {
                       e.snapshot.children.forEach((project) {
                          var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
                          userOBJ.userLikedProject.add(projectOBJ);
                        });
              });

       });
    return userOBJ;

  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
  Future<List<UserModel>> getListOfUsers() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<UserModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('User').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = UserModel.fromJson(value);
      list.add(user);
    });
    return list;

  }

 */
}