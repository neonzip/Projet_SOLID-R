
class SportModel {

  late String sportID;
  late String sportName;
  late double sportConversionRate;
  late double sportMaxSpeed;

  SportModel(String id, String name, double rate, double speed) {
    sportID = id;
    sportName = name;
    sportConversionRate = rate;
    sportMaxSpeed = speed;
  }

  SportModel.fromJson(Map<dynamic, dynamic> json)
      : sportID = json['sportID'] as String,
        sportName = json['sportName'] as String,
        sportConversionRate = double.parse(json['sportConversionRate'] as String),
        sportMaxSpeed = double.parse(json['sportMaxSpeed'] as String);


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'sportID' : sportID.toString(),
    'sportName': sportName.toString(),
    'sportConversionRate': sportConversionRate.toString(),
    'sportMaxSpeed':  sportMaxSpeed.toString(),
  };

  /***** GETTERS and SETTERS ******/

  String getSportID(){
    return sportID;
  }
  void setSportID(String id){
    sportID=id;
  }
  String getSportName(){
    return sportName;
  }
  void setSportName(String name){
    sportName=name;
  }
  double getSportConversionRate(){
    return sportConversionRate;
  }
  void setSportConversionRate(double c){
    sportConversionRate=c;
  }
  double getSportMaxSpeed(){
    return sportMaxSpeed;
  }
  void setSportMaxSpeed(double c){
     sportMaxSpeed=c;
  }
}