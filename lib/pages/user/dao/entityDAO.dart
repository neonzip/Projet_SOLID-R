import 'package:firebase_database/firebase_database.dart';
import '../model/EntityModel.dart';
import '../controller/Database.dart';

class entityDAO {
  late DatabaseReference _EntityRef = FirebaseDatabase.instance.ref().child('Entity');
  DataBase db = DataBase();

  entityDAO(){
    _EntityRef = db.db.ref().child('Entity');
  }

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
    return EntityOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Entity/'+ id.toString()).remove();
  }

  Future<List<EntityModel>> getListOfEntitys() async {
    final List<EntityModel> list = <EntityModel>[];
    final entitySnapshot = await FirebaseDatabase.instance.ref().child('Entity').get();
    EntityModel  entityOBJ;
    entitySnapshot.children.forEach((entity)=> {
      entityOBJ = EntityModel.fromJson(entity.value as Map<dynamic, dynamic>),
      list.add(entityOBJ),
    });
    return list;
  }



}