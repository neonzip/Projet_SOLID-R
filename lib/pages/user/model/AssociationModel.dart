import 'package:flutter/material.dart';

class AssociationModel {
  late int associationID;                    // Association's ID
  late String associationLogo;               // Association's logo
  late String associationWebSiteURL;         // Association's website
  late String associationDescription;        // Association's description

  AssociationModel() {
    associationLogo = "assets/logo_solid_R.png";  // Just by default
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
    return associationID;
  }
  setAssociationId(int id) {
    associationID = id;
  }

  /// ////////////////////////////
  String getAssociationDescription(){
    return associationDescription;
  }
  setAssociationDescription(String description) {
    associationDescription = description;
  }
}