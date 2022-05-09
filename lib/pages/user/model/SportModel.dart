import 'dart:ffi';

class SportModel {
  late int sportID;
  late String sportName;
  late double sportConversionRate;
  late double sportMaxSpeed;

  SportModel(int id, String name, double rate, double speed) {
    sportID = id;
    sportName = name;
    sportConversionRate = rate;
    sportMaxSpeed = speed;
  }

  SportModel.fromJson(Map<dynamic, dynamic> json)
      : sportName = json['name'] as String,
        sportConversionRate = double.parse(json['convertionRate'] as String),
        sportMaxSpeed = double.parse(json['maxSpeed'] as String);


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'sport_id' : sportID,
    'name': sportName,
    'convertionRate': sportConversionRate.toString(),
    'maxSpeed':  sportMaxSpeed.toString(),
  };
}