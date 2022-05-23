import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import '../model/AdvertisementModel.dart';
import '../controller/Database.dart';
class advertisementDAO {
  late DatabaseReference _advertisementRef = FirebaseDatabase.instance.ref().child('Advertisement');

  DataBase db = DataBase();

  sportDAO(){
    _advertisementRef = db.db.ref().child('Advertisement');
  }

  /*
  * This function takes an advertisement as a parameter and
  * uses the DatabaseReference to save the JSON advertisement
  * to your Realtime Database.
  *
  */

  Future<void> saveAdvertisement(AdvertisementModel advOBJ) async {
    _advertisementRef= db.db.ref().child('Advertisement/'+advOBJ.getAdvertisementID().toString());
    await _advertisementRef.set(advOBJ.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getAdvertisementQuery() {
    return _advertisementRef;
  }

  Future<AdvertisementModel> getAdvertisementByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final advertisementSnapshot = await ref.child('Advertisement/'+ id.toString()).get();
    final json = advertisementSnapshot.value as Map<dynamic, dynamic>;
    final aAdvertisementOBJ = AdvertisementModel.fromJson(json);
    print('Data : ${advertisementSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${aAdvertisementOBJ.advertisementURL}  ');
    return aAdvertisementOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Advertisement/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
  getListOfAdvertisements(){
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

  }

 */
}