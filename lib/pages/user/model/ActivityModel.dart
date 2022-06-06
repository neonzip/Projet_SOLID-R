class ActivityModel {
  late String activityID;
  late DateTime activityStartDate;
  late DateTime activityEndDate;
  late double activityDistance;
  late String userID;
  late String sportID;
  late double coin;

  ActivityModel (String activity, DateTime activityStart) {
    activityID = activity;
    activityStartDate = activityStart;
    activityEndDate = DateTime(0);
    activityDistance = 0;
    userID = "";
    sportID = "";
  }
  ActivityModel.ActivityModelFullConstructor(String activity, DateTime activityStart,String userId,String sportId):
        activityID = activity,
        activityStartDate = activityStart,
        activityEndDate = DateTime(0),
        activityDistance = 0,
        userID = userId,
        sportID = sportId,
        coin = 0.0;

  ActivityModel.fromJson(Map<dynamic, dynamic> json)
      : activityID = json['activityID'] as String,
        activityStartDate = DateTime.parse(json['startDate'] as String),
        activityEndDate = DateTime.parse(json['endDate'] as String),
        activityDistance = double.parse(json['distance'] as String),
        userID = json['userID'] as String,
        sportID = json['sportID'] as String,
        coin = double.parse(json['coin'] as String);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'activityID': activityID.toString(),
    'startDate': activityStartDate.toString(),
    'endDate': activityEndDate.toString(),
    'distance':  activityDistance.toString(),
    'userID' : userID.toString(),
    'sportID' : sportID.toString(),
    'coin' : coin,
  };

  /****** Getters and Setters *****/

   String getActivityID(){
     return activityID;
   }
   void setActivityID(String id){
     activityID = id;
   }

  DateTime getActivityStartDate(){
    return activityStartDate;
  }
  void setActivityStartDate(DateTime d){
    activityStartDate=d;
  }
  DateTime getActivityEndDate(){
    return activityStartDate;
  }
  void setActivityEndDate(DateTime d){
    activityEndDate=d;
  }
  double getActivityDistance(){
    return activityDistance;
  }
  void setActivityDistance(double d){
    activityDistance = d;
  }

  String getUserID(){
    return userID;
  }
  void setUserID(String id){
    userID = id;
  }

  String getSportID(){
    return sportID;
  }
  void setSportID(String id){
    sportID = id;
  }

  double getCoin(){
    return coin;
  }
  void setCoin(double value){
    coin = value;
  }
}