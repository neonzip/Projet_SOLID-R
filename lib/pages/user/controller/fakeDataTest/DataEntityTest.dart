import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

class DataEntityTest {
  late List<EntityModel> entitydataList = <EntityModel>[];

  DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataEntityTest() {
    EntityModel entity1 = EntityModel(1, "Entité 1", "Description entité 1", dataAdvertisementTest.advertisementDataList.elementAt(0));
    EntityModel entity2 = EntityModel(2, "Entité 2", "Description entité 2", dataAdvertisementTest.advertisementDataList.elementAt(1));
    EntityModel entity3 = EntityModel(3, "Entité 3", "Description entité 3", dataAdvertisementTest.advertisementDataList.elementAt(2));

    entitydataList.add(entity3);
    entitydataList.add(entity1);
    entitydataList.add(entity2);
  }

  List<String> getNameEntityDataList() {
    List<String> list = <String>[];
    for (int i = 0; i < entitydataList.length; i++) {
      list.add(entitydataList.elementAt(i).entityName);
    }
    return list;
  }
}