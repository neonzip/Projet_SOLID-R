import 'SportModel.dart';
import 'UserModel.dart';

class ActivityModel {
  late int activityID;
  late DateTime activityStartDate;
  late DateTime activityEndDate;
  late int activityDistance;

  late SportModel activitySport;

  late UserModel activityUser;

  //////////////////////////

  ActivityModel (int activity, DateTime activityStart) {
    activityID = activity;
    activityStartDate = activityStart;
    activityEndDate = DateTime(0);
    activityDistance = 0;
  }
}