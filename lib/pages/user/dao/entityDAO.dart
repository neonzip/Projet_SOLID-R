import 'package:firebase_database/firebase_database.dart';
import '../model/EntityModel.dart';
import '../controller/Database.dart';

class entityDAO {  // Entity //Entity
  late DatabaseReference _EntityRef = FirebaseDatabase.instance.ref().child('Entity');

  DataBase db = DataBase();

  entityDAO(){
    _EntityRef = db.db.ref().child('Entity');

  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON Entity
  * to your Realtime Database.
  *
  */

  Future<void> saveEntity(EntityModel ent) async {
    _EntityRef = db.db.ref().child('Entity/'+ent.toString());
    await _EntityRef.set(ent.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getEntityQuery() {
    return _EntityRef;
  }

  Future<EntityModel> getEntityByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final EntitySnapshot = await ref.child('Entity/'+ id.toString()).get();
    final json = EntitySnapshot.value as Map<dynamic, dynamic>;
    final EntityOBJ = EntityModel.fromJson(json);
    print('Data : ${EntitySnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${EntityOBJ.entityDescription}  ');
    return EntityOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Entity/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
  Future<List<EntityModel>> getListOfEntitys() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<EntityModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('Entity').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final ac = EntityModel.fromJson(value);
      list.add(ac);
    });
    return list;

  }


 */
}