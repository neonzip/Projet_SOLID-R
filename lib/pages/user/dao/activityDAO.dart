import 'package:firebase_database/firebase_database.dart';
import '../model/ActivityModel.dart';
import '../controller/Database.dart';

class activityDAO {
  late DatabaseReference _ActivityRef = FirebaseDatabase.instance.ref().child('Activity');

  DataBase db = DataBase();

  activityDAO(){
    _ActivityRef = db.db.ref().child('Activity');
  }

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
    return activityOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Activity/'+ id.toString()).remove();
  }

  Future<List<ActivityModel>> getListOfActivities() async {

    List<ActivityModel> list = <ActivityModel>[];

    final ref = FirebaseDatabase.instance.ref();
    ActivityModel activityOBJ;

    final activitySnapshot = await ref.child('Activity').get().whenComplete(() => null);
    activitySnapshot.children.forEach((activity)=> {
      activityOBJ = ActivityModel.fromJson(activity.value as Map<dynamic, dynamic>),
      list.add(activityOBJ),
    });

    return list;
  }



}
