import 'AdvertisementModel.dart';

class EntityModel {
  late int entityID;
  late String entityName;
  late String entityDescription;
  late AdvertisementModel entityAdvertisement;



  EntityModel(int id, String name, String description, AdvertisementModel ad) {
    entityID = id;
    entityName = name;
    entityDescription = description;
    entityAdvertisement = ad;
  }

  EntityModel.FromEntityModel(){ //empty constructor
    entityID = -1;
    entityName = "";
    entityDescription = "";
    entityAdvertisement = AdvertisementModel(-1,"");
  }

  EntityModel.fromJson(Map<dynamic, dynamic> json)
      : entityID = int.parse(json['entityID'] as String),
        entityName = json['entityName'] as String,
        entityDescription = json['entityDescription'] as String,
        entityAdvertisement = AdvertisementModel.fromJson(json['entityAdvertisement']);



  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'entityID': entityID.toString(),
    'entityName': entityName.toString(),
    'entityDescription': entityDescription.toString(),
    'entityAdvertisement': entityAdvertisement.toJson(),
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