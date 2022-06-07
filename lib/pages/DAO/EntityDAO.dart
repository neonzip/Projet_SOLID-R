import 'package:firebase_database/firebase_database.dart';
import '../user/controller/Database.dart';
import '../MODEL/EntityModel.dart';

class EntityDAO {
  late DatabaseReference entityRef = FirebaseDatabase.instance.ref().child('Entity');
  DataBase db = DataBase();

  EntityDAO(){
    entityRef = db.db.ref().child('Entity');
  }

  Future<void> saveEntity(EntityModel ent) async {
    entityRef = db.db.ref().child('Entity/'+ent.getEntityId().toString());
    await entityRef.set(ent.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getEntityQuery() {
    return entityRef;
  }

  /// Gets an entity with its ID.
  Future<EntityModel> getEntityByID(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    final entitySnapshot = await ref.child('Entity/'+ id.toString()).get();
    final json = entitySnapshot.value as Map<dynamic, dynamic>;
    final entityOBJ = EntityModel.fromJson(json);
    return entityOBJ;
  }

  /// Remove an entity in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Entity/'+ id.toString()).remove();
  }

  /// Update an entity in the database.
  updateEntity(EntityModel entityModel) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Entity/' + entityModel.entityID.toString()).update(
        {
          "entityDescription" : entityModel.entityDescription,
          "entityName" : entityModel.entityName,
        }
    );
    // TODO : update Advertisement !
  }

  /// Add an entity to the database.
  addEntity(EntityModel entity) async {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('Entity/').push();
    entity.entityID = newRef.key!;
    newRef.set(entity.toJson());
  }

  /// Gets the list of all entities.
  Future<List<EntityModel>> getListOfEntities() async {
    final List<EntityModel> list = <EntityModel>[];
    final entitySnapshot = await FirebaseDatabase.instance.ref().child('Entity').get();
    EntityModel  entityOBJ;
    for (var entity in entitySnapshot.children) {
      {
      entityOBJ = EntityModel.fromJson(entity.value as Map<dynamic, dynamic>);
      list.add(entityOBJ);
    };
    }
    return list;
  }
}