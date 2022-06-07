import 'package:projet_solid_r/pages/MODEL/EntityModel.dart';
import '../../../DAO/EntityDAO.dart';

class DataEntityTest {
  late List<EntityModel> entitydataList = <EntityModel>[];
  EntityDAO dao = EntityDAO();

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

    DAO.saveEntity(entity1);
    DAO.saveEntity(entity2);
    DAO.saveEntity(entity3);
 */
  }

  Future<List<EntityModel>> getEntityDataList() async {
    entitydataList = await dao.getListOfEntities();
    return entitydataList;
  }
}