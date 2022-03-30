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
}