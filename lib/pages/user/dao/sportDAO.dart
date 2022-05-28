import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import '../model/SportModel.dart';
import '../controller/Database.dart';


class sportDAO {
  late DatabaseReference _SportRef = FirebaseDatabase.instance.ref().child('Sport');
  DataBase db = DataBase();

  sportDAO(){
    _SportRef = db.db.ref().child('Sport');
  }

  Future<void> saveSport(SportModel sport) async {
    _SportRef = db.db.ref().child('Sport/'+sport.sportID.toString());
    await _SportRef.set(sport.toJson());
      // another way that works
      //_SportRef.push().set(sport.toJson());
  }

  Query getSportQuery() {
    return _SportRef;
  }

  Future<SportModel> getSportByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final sportSnapshot = await ref.child('Sport/'+ id.toString()).get();
    final json = sportSnapshot.value as Map<dynamic, dynamic>;
    final sportOBJ = SportModel.fromJson(json);
    return sportOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Sport/'+ id.toString()).remove();
  }

  Future<List<SportModel>> getListOfSports()  async {

    List<SportModel> list =  <SportModel>[];
    final ref = FirebaseDatabase.instance.ref();
    SportModel sportOBJ;

   final sportSnapshot = await ref.child('Sport').get();
   sportSnapshot.children.forEach((sport)=> {
       sportOBJ = SportModel.fromJson(sport.value as Map<dynamic, dynamic>),
        list.add(sportOBJ),
       });

   print(" list of sports ");
   list.forEach((e) { print("  " + e.sportName.toString()); });
   return  list;
  }




}