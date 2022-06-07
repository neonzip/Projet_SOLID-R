import 'package:firebase_database/firebase_database.dart';
import '../user/controller/Database.dart';
import '../MODEL/ActivityModel.dart';

class ActivityDAO {
  late DatabaseReference activityRef = FirebaseDatabase.instance.ref().child('Activity');
  DataBase db = DataBase();

  ActivityDAO(){
    activityRef = db.db.ref().child('Activity');
  }

  Future<void> saveActivity(ActivityModel activity) async {
    activityRef = db.db.ref().child('Activity/'+activity.activityID.toString());
    await activityRef.set(activity.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getActivityQuery() {
    return activityRef;
  }

  /// Get an activity with its ID in parameter.
  Future<ActivityModel> getActivityByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final activitySnapshot = await ref.child('Activity/'+ id.toString()).get();
    final json = activitySnapshot.value as Map<dynamic, dynamic>;
    final activityOBJ = ActivityModel.fromJson(json);
    return activityOBJ;
  }

  /// Delete an activity in the database.
  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Activity/'+ id.toString()).remove();
  }

  /// Gets the list of all activities.
  Future<List<ActivityModel>> getListOfActivities() async {

    List<ActivityModel> list = <ActivityModel>[];

    final ref = FirebaseDatabase.instance.ref();
    ActivityModel activityOBJ;

    final activitySnapshot = await ref.child('Activity').get();
    activitySnapshot.children.forEach((activity)=> {
      activityOBJ = ActivityModel.fromJson(activity.value as Map<dynamic, dynamic>),
      list.add(activityOBJ),
    });

    return list;
  }

  /// Add en activity to the database.
  addActivity(ActivityModel activity) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('Activity/').push();
    activity.activityID = newRef.key!;
    newRef.set(activity.toJson());
  }
}
