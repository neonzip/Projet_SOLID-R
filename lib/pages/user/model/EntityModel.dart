import 'AdvertisementModel.dart';

class EntityModel {
  late int entityID;
  late String entityName;
  late String entityDescription;

  late AdvertisementModel advertisementEntity;


  EntityModel(int id, String name, String description) {
    entityID = id;
    entityName = name;
    entityDescription = description;
  }

  /// ////////////////////////////
  int getEntityId() {
    return entityID;
  }
  setEntityId(int id) {
    entityID = id;
  }

  /// ////////////////////////////
  String getEntityName() {
    return entityName;
  }
  setEntityName(String name) {
    entityName = name;
  }

  /// ////////////////////////////
  String getEntityDescription() {
    return entityDescription;
  }
  setEntityDescription(String description) {
    entityDescription = description;
  }

  /// /////////////////////////////
  AdvertisementModel getEntityAdvertisement() {
    return advertisementEntity;
  }
  setResultProject(AdvertisementModel add) {
    advertisementEntity = add;
  }
}