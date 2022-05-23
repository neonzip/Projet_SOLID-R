import 'package:firebase_database/firebase_database.dart';
import '../model/AssociationModel.dart';
import '../controller/Database.dart';

class associationDAO {  // association //Association
  late DatabaseReference _AssociationRef = FirebaseDatabase.instance.ref().child('Association');

  DataBase db = DataBase();

  activityDAO(){
    _AssociationRef = db.db.ref().child('Association');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveActivity(AssociationModel association) async {
    _AssociationRef = db.db.ref().child('Activity/'+association.toString());
    await _AssociationRef.set(association.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getAssociationQuery() {
    return _AssociationRef;
  }

  Future<AssociationModel> getAssociationyByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final associationSnapshot = await ref.child('Association/'+ id.toString()).get();
    final json = associationSnapshot.value as Map<dynamic, dynamic>;
    final associationOBJ = AssociationModel.fromJson(json);
    print('Data : ${associationSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${associationOBJ.associationAdvertisementURL}  ');
    return associationOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Association/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
  Future<List<AssociationModel>> getListOfAssociations() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<AssociationModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('Association').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final ac = AssociationModel.fromJson(value);
      list.add(ac);
    });
    return list;

  }


 */
}