import '../../model/SportModel.dart';

class DataSportTest {
  List<SportModel> sportDataList = <SportModel>[];
  DataSportTest() {
    SportModel sport1 = SportModel(1, "Basketball", 2.0, 25.9);
    SportModel sport2 = SportModel(2, "Football", 5.0, 20.9);
    SportModel sport3 = SportModel(3, "Running", 10.0, 18.7);
    SportModel sport4 = SportModel(4, "Swimming", 2.0, 24.3);
    SportModel sport5 = SportModel(5, "Horse riding", 1.3, 25.4);
    sportDataList.add(sport1);
    sportDataList.add(sport2);
    sportDataList.add(sport3);
    sportDataList.add(sport4);
    sportDataList.add(sport5);
  }

  List<SportModel> getSportDataList() {
    return sportDataList;
  }

  List <String> getNameSportDataList() {
    List<String> list = <String>[];
    for (int i = 0; i < sportDataList.length; i ++) {
      list.add(sportDataList.elementAt(i).sportName);
    }
    return list;
  }
}