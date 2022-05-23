import 'package:projet_solid_r/pages/user/model/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

class AssociationModel extends EntityModel {
  late String associationLogo;               // Association's logo
  late String associationWebSiteURL;         // Association's website
  late String associationAdvertisementURL;   // Association's ad URL
  late String associationMail;

  AssociationModel (int id, String name, String description, String logo, AdvertisementModel ad, String websiteURL) : super(id, name, description, ad) {

    associationLogo = logo;
    associationAdvertisementURL = ad.advertisementURL;
    associationWebSiteURL = websiteURL;
    associationMail = "xxx@yyy.zz";
  }

  AssociationModel.fromJson(Map<dynamic, dynamic> json) : super.FromEntityModel(){
    associationLogo = json['associationLogo'];
    associationWebSiteURL = json['associationWebSiteURL'];
    associationAdvertisementURL = json['associationAdvertisementURL'];
    associationMail = json['associationMail'];

  }

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'associationLogo': associationLogo,
    'associationWebSiteURL': associationWebSiteURL,
    'associationAdvertisementURL': associationAdvertisementURL,
    'associationMail': associationMail,
  };
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

  /// ////////////////////////////
  String getAssociationMail(){
    return associationMail;
  }
  setAssociationMail(String mail) {
    associationMail = mail;
  }
}