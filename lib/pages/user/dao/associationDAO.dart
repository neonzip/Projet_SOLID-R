import 'package:firebase_database/firebase_database.dart';
import '../model/AssociationModel.dart';
import '../controller/Database.dart';

class associationDAO {
  late DatabaseReference _AssociationRef = FirebaseDatabase.instance.ref().child('Association');

  DataBase db = DataBase();

  associationDAO(){
    _AssociationRef = db.db.ref().child('Association');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveAssociation(AssociationModel association) async {
    _AssociationRef = db.db.ref().child('Association/'+association.getEntityId().toString());
    await _AssociationRef.set(association.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getAssociationQuery() {
    return _AssociationRef;
  }

  Future<AssociationModel> getAssociationyByID(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    final associationSnapshot = await ref.child('Association/'+ id.toString()).get();
    final json = associationSnapshot.value as Map<dynamic, dynamic>;
    final associationOBJ = AssociationModel.fromJson(json);
    return associationOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Association/'+ id.toString()).remove();
  }

  addAssociation(AssociationModel associationModel) async {
    final ref = FirebaseDatabase.instance.ref();

    DatabaseReference newRef = ref.child('Association/').push();
    associationModel.entityID = newRef.key!;
    newRef.set(associationModel.toJson());
  }

  updateAssociation(AssociationModel associationModel) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Association/' + associationModel.entityID.toString()).update(
        {
          "associationLogo" : associationModel.associationLogo,
          "associationMail" : associationModel.associationMail,
          "associationWebSiteURL" : associationModel.associationWebSiteURL,
          "entityDescription" : associationModel.entityDescription,
          "entityID" : associationModel.entityID.toString(),
          "entityName" : associationModel.entityName,
        }
    );
    // TODO : update Advertisement !
  }

  Future<List<AssociationModel>> getListOfAssociations() async {

    final List<AssociationModel> list = <AssociationModel>[];
    final associationSnapshot = await FirebaseDatabase.instance.ref().child('Association').get();
    AssociationModel  assocOBJ;
    associationSnapshot.children.forEach((assoc)=> {
      assocOBJ = AssociationModel.fromJson(assoc.value as Map<dynamic, dynamic>),
      list.add(assocOBJ),
    });

    return list;
  }



}