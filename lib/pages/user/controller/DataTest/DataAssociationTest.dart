import 'package:projet_solid_r/pages/MODEL/AssociationModel.dart';

import '../../../DAO/AssociationDAO.dart';
import '../../model/AdvertisementModel.dart';
class DataAssociationTest {
  late List<AssociationModel> assoDataList = <AssociationModel>[];
  //late DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();
  late AssociationDAO dao = AssociationDAO();

  /// Creates what we have to replace with the database.
  DataAssociationTest() {
    /*
    AdvertisementModel ad1 = AdvertisementModel(1, "assets/AdvertisementNetworks/video1.mp4");

    AssociationModel asso1 = AssociationModel("1", "Association 1", "Description asso 1", "assets/LogoAssociation/logo1.jpg", ad1, "https://www.jardiland.com/");
    AssociationModel asso2 = AssociationModel("2", "Association 2", "Description asso 2", "assets/LogoAssociation/logo2.jpg", ad1, "https://fr.wikipedia.org/wiki/Wikip%C3%A9dia:Accueil_principal");
    AssociationModel asso3 = AssociationModel("3", "Association 3", "Description asso 3", "assets/LogoAssociation/logo4.jpg", ad1 , "https://amazon.ca");

    assoDataList.add(asso1);
    assoDataList.add(asso2);
    assoDataList.add(asso3);

    DAO.saveAssociation(asso1);
    DAO.saveAssociation(asso2);
    DAO.saveAssociation(asso3);

    DAO.getAssociationyByID("1");

     */
  }

  Future<List<AssociationModel>> getAssoDataList() async {
    assoDataList = await dao.getListOfAssociations();
    return assoDataList;
  }

}

/// https://www.freemake.com/fr/free_video_downloader_top/
/// Link to download for free Youtube videos in line