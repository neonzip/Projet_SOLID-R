import 'package:firebase_database/firebase_database.dart';
import '../model/AssociationModel.dart';
import '../controller/Database.dart';

class associationDAO {  // association //Association
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

  Future<void> saveActivity(AssociationModel association) async {
    _AssociationRef = db.db.ref().child('Association/'+association.toString());
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
    return associationOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Association/'+ id.toString()).remove();
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