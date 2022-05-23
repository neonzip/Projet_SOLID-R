import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import '../model/SportModel.dart';
import '../controller/Database.dart';
class sportDAO {
  late DatabaseReference _SportRef = FirebaseDatabase.instance.ref().child('Sport');

  DataBase db = DataBase();

  sportDAO(){
    _SportRef = db.db.ref().child('Sport');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveSport(SportModel sport) async {
    _SportRef = db.db.ref().child('Sport/'+sport.sportID.toString());
    await _SportRef.set(sport.toJson());
      // another way that works
      //_SportRef.push().set(sport.toJson());
  }

  Query getSportQuery() {
    return _SportRef;
  }

  Future<SportModel> getSportByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final sportSnapshot = await ref.child('Sport/'+ id.toString()).get();
    final json = sportSnapshot.value as Map<dynamic, dynamic>;
    final sportOBJ = SportModel.fromJson(json);
    print('Data : ${sportSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${sportOBJ.sportName}  ');
    return sportOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Sport/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
 Future<List<SportModel>> getListOfSports() async {
   /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<SportModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('Sport').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        final sprt = SportModel.fromJson(value);
        list.add(sprt);
      });
     return list;

  }

 */
}