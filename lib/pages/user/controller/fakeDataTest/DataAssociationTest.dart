import 'package:projet_solid_r/pages/user/model/AssociationModel.dart';
class DataAssociationTest {
  late List<AssociationModel> assodataList = <AssociationModel>[];

  /// Creates what we have to replace with the database.
  DataAssociationTest() {
    AssociationModel asso1 = AssociationModel(1, "Association 1", "Description asso 1", "assets/LogoAssociation/logo1.jpg");
    AssociationModel asso2 = AssociationModel(2, "Association 2", "Description asso 2", "assets/LogoAssociation/logo2.jpg");
    AssociationModel asso3 = AssociationModel(3, "Association 3", "Description asso 3", "assets/LogoAssociation/logo4.jpg");

    assodataList.add(asso1);
    assodataList.add(asso2);
    assodataList.add(asso3);
  }
}