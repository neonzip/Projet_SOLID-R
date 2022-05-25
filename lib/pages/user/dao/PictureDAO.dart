import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import '../model/PictureModel.dart';
import '../controller/Database.dart';
class PictureDAO {
  late DatabaseReference _PictureRef = FirebaseDatabase.instance.ref().child('Picture');

  DataBase db = DataBase();

  PictureDAO(){
    _PictureRef = db.db.ref().child('Picture');
  }


  Future<void> savePicture(PictureModel pic) async {
    _PictureRef = db.db.ref().child('Picture/'+pic.getIdPicture.toString());
    await _PictureRef.set(pic.toJson());

  }

  Query getPictureQuery() {
    return _PictureRef;
  }

  Future<PictureModel> getPictureByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final pictureSnapshot = await ref.child('Picture/'+ id.toString()).get();
    final json = pictureSnapshot.value as Map<dynamic, dynamic>;
    final pictureOBJ = PictureModel.fromJson(json);
    print('Data : ${pictureSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${pictureOBJ.pictureDescription}  ');
    return pictureOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Picture/'+ id.toString()).remove();
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

