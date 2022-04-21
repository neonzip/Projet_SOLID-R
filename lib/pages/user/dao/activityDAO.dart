import 'package:firebase_database/firebase_database.dart';
import '../model/ActivityModel.dart';

class activityDAO {
  final DatabaseReference _ActivityRef =
  FirebaseDatabase.instance.reference().child('Activity');

  /*
  * This function takes an activity as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.*/
  void saveActivity(ActivityModel activity) {
    _ActivityRef.push().set(activity.toJson());
  }

  Query getActivityQuery() {
    return _ActivityRef;
  }
}
