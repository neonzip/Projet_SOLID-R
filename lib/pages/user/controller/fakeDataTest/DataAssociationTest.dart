import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/model/AssociationModel.dart';
class DataAssociationTest {
  late List<AssociationModel> assoDataList = <AssociationModel>[];

  late DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataAssociationTest() {
    AssociationModel asso1 = AssociationModel(1, "Association 1", "Description asso 1", "assets/LogoAssociation/logo1.jpg", dataAdvertisementTest.advertisementDataList.elementAt(0), "https://www.jardiland.com/");
    AssociationModel asso2 = AssociationModel(2, "Association 2", "Description asso 2", "assets/LogoAssociation/logo2.jpg", dataAdvertisementTest.advertisementDataList.elementAt(1), "https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal");
    AssociationModel asso3 = AssociationModel(3, "Association 3", "Description asso 3", "assets/LogoAssociation/logo4.jpg", dataAdvertisementTest.advertisementDataList.elementAt(2), "https://amazon.ca");

    assoDataList.add(asso1);
    assoDataList.add(asso2);
    assoDataList.add(asso3);
  }
}

/// https://www.freemake.com/fr/free_video_downloader_top/
/// Link to download for free Youtube videos in line