
import 'package:firebase_database/firebase_database.dart';
import '../model/UserModel.dart';
import '../controller/Database.dart';

class UserDAO {
  late DatabaseReference _userRef = FirebaseDatabase.instance.ref().child('User');
  DataBase db = DataBase();

  UserDAO(){
    _userRef = db.db.ref().child('User');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveUser(UserModel user) async {
    _userRef = db.db.ref().child('User/'+user.userID.toString());
    await _userRef.set(user.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getUserQuery() {
    return _userRef;
  }

  Future<UserModel> getUserByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final userSnapshot = await ref.child('User/'+ id.toString()).get();
    final json = userSnapshot.value as Map<dynamic, dynamic>;
    final userOBJ = UserModel.fromJson(json);
    print('Data : ${userSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${userOBJ.userEmail}  ');
    return userOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('User/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }

  Future<List<UserModel>> getListOfUsers() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<UserModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('User').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = UserModel.fromJson(value);
      list.add(user);
    });
    return list;

  }
}