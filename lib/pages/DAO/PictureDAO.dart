import 'package:firebase_database/firebase_database.dart';
import '../user/controller/Database.dart';
import '../MODEL/PictureModel.dart';
class PictureDAO {
  late DatabaseReference pictureRef = FirebaseDatabase.instance.ref().child('Picture');

  DataBase db = DataBase();

  PictureDAO(){
    pictureRef = db.db.ref().child('Picture');
  }


  Future<void> savePicture(PictureModel pic) async {
    pictureRef = db.db.ref().child('Picture/'+pic.getIdPicture.toString());
    await pictureRef.set(pic.toJson());
  }

  Query getPictureQuery() {
    return pictureRef;
  }

  /// Gets a picture with its ID.
  Future<PictureModel> getPictureByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final pictureSnapshot = await ref.child('Picture/'+ id.toString()).get();
    final json = pictureSnapshot.value as Map<dynamic, dynamic>;
    final pictureOBJ = PictureModel.fromJson(json);
    return pictureOBJ;
  }

  /// Removes a picture in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Picture/'+ id.toString()).remove();
  }

  /// Gets the list of all pictures.
  Future<List<PictureModel>> getListOfPictures() async {
    final List<PictureModel> list = <PictureModel>[];
    final picturesSnapshot = await FirebaseDatabase.instance.ref().child('Picture').get();
    PictureModel  pictureOBJ;
    for (var entity in picturesSnapshot.children) {
      {
        pictureOBJ = PictureModel.fromJson(entity.value as Map<dynamic, dynamic>);
        list.add(pictureOBJ);
      }
    }
    return list;
  }
  }

