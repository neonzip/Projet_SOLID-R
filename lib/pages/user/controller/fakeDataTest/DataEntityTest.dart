import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

class DataEntityTest {
  late List<EntityModel> entitydataList = <EntityModel>[];

  /// Creates what we have to replace with the database.
  DataEntityTest() {
    EntityModel entity1 = EntityModel(1, "Entité 1", "Description entité 1");
    EntityModel entity2 = EntityModel(2, "Entité 2", "Description entité 2");
    EntityModel entity3 = EntityModel(3, "Entité 3", "Description entité 3");

    entitydataList.add(entity3);
    entitydataList.add(entity1);
    entitydataList.add(entity2);
  }
}