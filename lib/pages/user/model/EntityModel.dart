import 'AdvertisementModel.dart';

class EntityModel {
  late int entityID;
  late String entityName;
  late String entityDescription;
  late AdvertisementModel entityAdvertisement;

  EntityModel() {

  }

  EntityModel.fromJson(Map<dynamic, dynamic> json)
      : entityID = json['entityID'],
        entityName = json['entityName'],
        entityDescription = json['entityDescription'],
        entityAdvertisement = json['entityAdvertisement'];



  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'entityID': entityID,
    'entityName': entityName,
    'entityDescription': entityDescription,
    'AdvertisementModel': AdvertisementModel,
  };

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
    return entityAdvertisement;
  }
  setEntityAdvertisement(AdvertisementModel ad) {
    entityAdvertisement = ad;
  }

  /// /////////////////////////////
  AdvertisementModel getEntityAdvertisementURL() {
    return entityAdvertisement;
  }
  setEntityAdvertisementURL(String adURL) {
    entityAdvertisement.setAdvertisementURL(adURL);
  }
}