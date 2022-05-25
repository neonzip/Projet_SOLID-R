import 'SportModel.dart';


class ActivityModel {
  late int activityID;
  late DateTime activityStartDate;
  late DateTime activityEndDate;
  late int activityDistance;
  late int userID;
  late int sportID;

  //////////////////////////

  ActivityModel (int activity, DateTime activityStart) {
    activityID = activity;
    activityStartDate = activityStart;
    activityEndDate = DateTime(0);
    activityDistance = 0;
    userID = -1;
    sportID = -1;
  }
  ActivityModel.ActivityModelFullConstructor(int activity, DateTime activityStart,int userId,int sportId):
        activityID = activity,
        activityStartDate = activityStart,
        activityEndDate = DateTime(0),
        activityDistance = 0,
        userID = userId,
        sportID = sportId;

  ActivityModel.fromJson(Map<dynamic, dynamic> json)
      : activityID = int.parse(json['activityID'] as String),
        activityStartDate = DateTime.parse(json['startDate'] as String),
        activityEndDate = DateTime.parse(json['endDate'] as String),
        activityDistance = int.parse(json['distance'] as String),
        userID = int.parse(json['userID'] as String),
        sportID = int.parse(json['sportID'] as String);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'activityID': activityID.toString(),
    'startDate': activityStartDate.toString(),
    'endDate': activityEndDate.toString(),
    'distance':  activityDistance.toString(),
    'userID' : userID.toString(),
    'sportID' : sportID.toString(),
  };
}