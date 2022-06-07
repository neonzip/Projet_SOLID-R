import 'package:firebase_database/firebase_database.dart';
import '../user/controller/Database.dart';
import '../MODEL/AdvertisementModel.dart';

class AdvertisementDAO {
  late DatabaseReference advertisementRef = FirebaseDatabase.instance.ref().child('Advertisement');

  DataBase db = DataBase();

  AdvertisementDAO(){
    advertisementRef = db.db.ref().child('Advertisement');
  }

  Future<void> saveAdvertisement(AdvertisementModel advOBJ) async {
    advertisementRef= db.db.ref().child('Advertisement/'+advOBJ.getAdvertisementID().toString());
    await advertisementRef.set(advOBJ.toJson());
    // another way that works
    //_AdvertisementRef.push().set(Advertisement.toJson());
  }

  Query getAdvertisementQuery() {
    return advertisementRef;
  }

  Future<AdvertisementModel> getAdvertisementByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final advertisementSnapshot = await ref.child('Advertisement/'+ id.toString()).get();
    final json = advertisementSnapshot.value as Map<dynamic, dynamic>;
    final aAdvertisementOBJ = AdvertisementModel.fromJson(json);
    return aAdvertisementOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Advertisement/'+ id.toString()).remove();
  }

  Future<List<AdvertisementModel>> getListOfAdvertisements() async {
    List<AdvertisementModel> list = <AdvertisementModel>[];

    final ref = FirebaseDatabase.instance.ref();
    AdvertisementModel AdvertisementOBJ;

    final AdvertisementSnapshot = await ref.child('Advertisement').get().whenComplete(() => null);
    AdvertisementSnapshot.children.forEach((Advertisement)=> {
      //print("inside the loop : "+ AdvertisementModel.fromJson(Advertisement.snapshot.value as Map<dynamic, dynamic>).AdvertisementName.toString()),
      AdvertisementOBJ = AdvertisementModel.fromJson(Advertisement.value as Map<dynamic, dynamic>),
      list.add(AdvertisementOBJ),
    });

    return list;
  }
 
}