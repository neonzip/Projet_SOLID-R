import 'package:projet_solid_r/pages/MODEL/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/MODEL/EntityModel.dart';

class AssociationModel extends EntityModel {
  late String associationLogo;               // Association's logo
  late String associationWebSiteURL;         // Association's website
  //removed because the ad url can be accessed directly from the inherited ad
  //late String associationAdvertisementURL;   // Association's ad URL
  late String associationMail;

  AssociationModel (String id, String name, String description, String logo, AdvertisementModel ad, String websiteURL) : super(id, name, description, ad) {
    associationLogo = logo;
    associationWebSiteURL = websiteURL;
    associationMail = "xxx@yyy.zz";
  }

  AssociationModel.fromJson(Map<dynamic, dynamic> json) : super.fromJson(json)  {
    entityID = json['entityID'] as String;
     entityAdvertisement = AdvertisementModel.fromJson(json['entityAdvertisement']);  //later
    entityDescription = json['entityDescription'];
    entityName = json['entityName']  as String;
    associationLogo = json['associationLogo'] as String;
    associationWebSiteURL = json['associationWebSiteURL'] as String ;
    //associationAdvertisement = json['associationAdvertisement'];
    associationMail = json['associationMail'] as String;

  }

  @override
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>  {

    'entityID': entityID.toString(),
    'entityAdvertisement': entityAdvertisement.toJson(),
    'entityDescription': entityDescription.toString(),
    'entityName': entityName.toString(),
    'associationLogo': associationLogo.toString(),
    'associationWebSiteURL': associationWebSiteURL.toString(),
    //'associationAdvertisementURL': associationAdvertisement,
    'associationMail': associationMail.toString(),
  };

  /// ////////////////////////////
  String getAssociationLogo() {
    return associationLogo;
  }
  setAssociationLogo(String logo) {
    associationLogo = logo;
  }

  /// ////////////////////////////
  String getAssociationId() {
    return entityID;
  }
  setAssociationId(String id) {
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