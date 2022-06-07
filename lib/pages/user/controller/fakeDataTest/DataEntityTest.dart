import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/dao/entityDAO.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

import '../../model/AdvertisementModel.dart';

class DataEntityTest {
  late List<EntityModel> entitydataList = <EntityModel>[];
  entityDAO dao = entityDAO();

  /// Creates what we have to replace with the database.
  DataEntityTest() {
/*
    AdvertisementModel ad1 = AdvertisementModel(1, "assets/AdvertisementNetworks/video1.mp4");
    EntityModel entity1 = EntityModel("1", "Entité 1", "Description entité 1", ad1);
    EntityModel entity2 = EntityModel("2", "Entité 2", "Description entité 2", ad1);
    EntityModel entity3 = EntityModel("3", "Entité 3", "Description entité 3", ad1);

    entitydataList.add(entity3);
    entitydataList.add(entity1);
    entitydataList.add(entity2);

    dao.saveEntity(entity1);
    dao.saveEntity(entity2);
    dao.saveEntity(entity3);
 */
  }

  List<String> getNameEntityDataList() {
    List<String> list = <String>[];
    for (int i = 0; i < entitydataList.length; i++) {
      list.add(entitydataList.elementAt(i).entityName);
    }
    return list;
  }
  Future<List<EntityModel>> getEntityDataList() async {
    entitydataList = await dao.getListOfEntities();
    return entitydataList;
  }
}