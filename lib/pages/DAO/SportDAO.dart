import 'package:firebase_database/firebase_database.dart';

import '../user/controller/Database.dart';
import '../MODEL/SportModel.dart';


class SportDAO {
  late DatabaseReference sportRef = FirebaseDatabase.instance.ref().child('Sport');
  DataBase db = DataBase();

  SportDAO(){
    sportRef = db.db.ref().child('Sport');
  }

  Future<void> saveSport(SportModel sport) async {
    sportRef = db.db.ref().child('Sport/'+sport.sportID.toString());
    await sportRef.set(sport.toJson());
      // another way that works
      //_SportRef.push().set(sport.toJson());
  }

  Query getSportQuery() {
    return sportRef;
  }

  /// Get a sport with its ID.
  Future<SportModel> getSportByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final sportSnapshot = await ref.child('Sport/'+ id.toString()).get();
    final json = sportSnapshot.value as Map<dynamic, dynamic>;
    final sportOBJ = SportModel.fromJson(json);
    return sportOBJ;
  }


  /// Remove a sport in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Sport/'+ id.toString()).remove();
  }

  /// Gets the list of all sports.
  Future<List<SportModel>> getListOfSports()  async {

    List<SportModel> list =  <SportModel>[];
    final ref = FirebaseDatabase.instance.ref();
    SportModel sportOBJ;

   final sportSnapshot = await ref.child('Sport').get();
   for (var sport in sportSnapshot.children) {
     {
       sportOBJ = SportModel.fromJson(sport.value as Map<dynamic, dynamic>);
       list.add(sportOBJ);
     }
   }
   
   return  list;
  }




}