import 'package:projet_solid_r/pages/user/model/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

class AssociationModel extends EntityModel {
  late String associationLogo;               // Association's logo
  late String associationWebSiteURL;         // Association's website

  late String associationAdvertisementURL;   // Association's ad URL

  AssociationModel (int id, String name, String description, String logo, AdvertisementModel ad, String websiteURL) : super(id, name, description, ad) {
    associationLogo = logo;
    associationAdvertisementURL = ad.advertisementURL;
    associationWebSiteURL = websiteURL;
  }

  /// ////////////////////////////
  String getAssociationLogo() {
    return associationLogo;
  }
  setAssociationLogo(String logo) {
    associationLogo = logo;
  }

  /// ////////////////////////////
  int getAssociationId() {
    return entityID;
  }
  setAssociationId(int id) {
    entityID = id;
  }

  /// ////////////////////////////
  String getAssociationDescription(){
    return entityDescription;
  }
  setAssociationDescription(String description) {
    setEntityDescription(description);
  }

  /// ////////////////////////////
  String getAssociationAdvertisementURL(){
    return associationAdvertisementURL;
  }
  setAssociationAdvertisementURL(String ad) {
    setEntityAdvertisementURL(ad);
  }
}