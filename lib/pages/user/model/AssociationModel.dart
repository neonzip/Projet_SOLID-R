import 'package:projet_solid_r/pages/user/model/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

class AssociationModel extends EntityModel {
  late String associationLogo;               // Association's logo
  late String associationWebSiteURL;         // Association's website
  //removed because the ad url can be accessed directly from the inherited ad
  //late String associationAdvertisementURL;   // Association's ad URL
  late String associationMail;

  AssociationModel (int id, String name, String description, String logo, AdvertisementModel ad, String websiteURL) : super(id, name, description, ad) {
    associationLogo = logo;
    associationWebSiteURL = websiteURL;
    associationMail = "xxx@yyy.zz";
  }

  AssociationModel.fromJson(Map<dynamic, dynamic> json) : super.FromEntityModel(){
    this.entityID = json['entityID'];
    this.entityAdvertisement = AdvertisementModel.fromJson(json['entityAdvertisement']);  //later
    this.entityDescription = json['entityDescription'];
    this.entityName = json['entityName'];
    associationLogo = json['associationLogo'];
    associationWebSiteURL = json['associationWebSiteURL'];
    //associationAdvertisement = json['associationAdvertisement'];
    associationMail = json['associationMail'];

  }

  @override
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic> {
    'entityID': this.entityID.toString(),
    'entityAdvertisement': this.entityAdvertisement.toJson(),
    'entityDescription': this.entityDescription.toString(),
    'entityName': this.entityName.toString(),
    'associationLogo': associationLogo.toString(),
    'associationWebSiteURL': associationWebSiteURL.toString(),
    //'associationAdvertisementURL': associationAdvertisement,
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
  /*AdvertisementModel getAssociationAdvertisement(){
    return associationAdvertisement;
  }
  setAssociationAdvertisementURL(String ad) {
    setEntityAdvertisementURL(ad);
  }
*/
  /// ////////////////////////////
  String getAssociationMail(){
    return associationMail;
  }
  setAssociationMail(String mail) {
    associationMail = mail;
  }
}