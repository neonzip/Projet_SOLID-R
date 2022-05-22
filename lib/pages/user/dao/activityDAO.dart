import 'package:firebase_database/firebase_database.dart';
import '../model/ActivityModel.dart';
import '../controller/Database.dart';

class activityDAO {
  late DatabaseReference _ActivityRef = FirebaseDatabase.instance.ref().child('Activity');

  DataBase db = DataBase();

  activityDAO(){
    _ActivityRef = db.db.ref().child('Activity');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveActivity(ActivityModel activity) async {
    _ActivityRef = db.db.ref().child('Activity/'+activity.activityID.toString());
    await _ActivityRef.set(activity.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getActivityQuery() {
    return _ActivityRef;
  }

  Future<ActivityModel> getActivityByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final activitySnapshot = await ref.child('Activity/'+ id.toString()).get();
    final json = activitySnapshot.value as Map<dynamic, dynamic>;
    final activityOBJ = ActivityModel.fromJson(json);
    print('Data : ${activitySnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${activityOBJ.activityDistance}  ');
    return activityOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Activity/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }

  Future<List<ActivityModel>> getListOfActivities() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<ActivityModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('Activity').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final ac = ActivityModel.fromJson(value);
      list.add(ac);
    });
    return list;

  }

}
