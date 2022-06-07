import 'package:firebase_database/firebase_database.dart';

import '../user/controller/Database.dart';
import '../MODEL/AssociationModel.dart';

class AssociationDAO {
  late DatabaseReference associationRef = FirebaseDatabase.instance.ref().child('Association');

  DataBase db = DataBase();

  AssociationDAO(){
    associationRef = db.db.ref().child('Association');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveAssociation(AssociationModel association) async {
    associationRef = db.db.ref().child('Association/'+association.getEntityId().toString());
    await associationRef.set(association.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getAssociationQuery() {
    return associationRef;
  }


  /// Gets one association by its ID.
  Future<AssociationModel> getAssociationyByID(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    final associationSnapshot = await ref.child('Association/'+ id.toString()).get();
    final json = associationSnapshot.value as Map<dynamic, dynamic>;
    final associationOBJ = AssociationModel.fromJson(json);
    return associationOBJ;
  }

  /// Delete an association in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Association/'+ id.toString()).remove();
  }

  /// Add an association in the database.
  addAssociation(AssociationModel associationModel) async {
    final ref = FirebaseDatabase.instance.ref();

    DatabaseReference newRef = ref.child('Association/').push();
    associationModel.entityID = newRef.key!;
    newRef.set(associationModel.toJson());
  }

  /// Updates totally an association in the database.
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

  /// Gets the list of all associations.
  Future<List<AssociationModel>> getListOfAssociations() async {

    final List<AssociationModel> list = <AssociationModel>[];
    final associationSnapshot = await FirebaseDatabase.instance.ref().child('Association').get();
    AssociationModel  assocOBJ;
    for (var assoc in associationSnapshot.children) {
      {
        assocOBJ = AssociationModel.fromJson(assoc.value as Map<dynamic, dynamic>);
        list.add(assocOBJ);
      }
    }

    return list;
  }
}