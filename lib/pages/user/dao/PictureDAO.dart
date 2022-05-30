import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import '../model/PictureModel.dart';
import '../controller/Database.dart';
class PictureDAO {
  late DatabaseReference _PictureRef = FirebaseDatabase.instance.ref().child('Picture');

  DataBase db = DataBase();

  PictureDAO(){
    _PictureRef = db.db.ref().child('Picture');
  }


  Future<void> savePicture(PictureModel pic) async {
    _PictureRef = db.db.ref().child('Picture/'+pic.getIdPicture.toString());
    await _PictureRef.set(pic.toJson());
  }

  Query getPictureQuery() {
    return _PictureRef;
  }

  Future<PictureModel> getPictureByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final pictureSnapshot = await ref.child('Picture/'+ id.toString()).get();
    final json = pictureSnapshot.value as Map<dynamic, dynamic>;
    final pictureOBJ = PictureModel.fromJson(json);
    return pictureOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Picture/'+ id.toString()).remove();
  }
  Future<List<PictureModel>> getListOfPictures() async {
    final List<PictureModel> list = <PictureModel>[];
    final picturesSnapshot = await FirebaseDatabase.instance.ref().child('Picture').get();
    PictureModel  pictureOBJ;
    picturesSnapshot.children.forEach((entity)=> {
      pictureOBJ = PictureModel.fromJson(entity.value as Map<dynamic, dynamic>),
      list.add(pictureOBJ),
    });
    return list;
  }
  }

