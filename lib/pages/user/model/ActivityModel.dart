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
  ActivityModel.fromJson(Map<dynamic, dynamic> json)
      : activityStartDate = DateTime.parse(json['startDate'] as String),
        activityEndDate = DateTime.parse(json['endDate'] as String),
        activityDistance = int.parse(json['distance'] as String);



  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'startDate': activityStartDate.toString(),
    'endDate': activityEndDate.toString(),
    'distance':  activityDistance.toString(),
  };
}