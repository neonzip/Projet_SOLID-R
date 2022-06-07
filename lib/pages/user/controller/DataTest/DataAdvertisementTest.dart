import 'package:projet_solid_r/pages/MODEL/AdvertisementModel.dart';

import '../../../DAO/AdvertisementDAO.dart';

class DataAdvertisementTest {
  late List<AdvertisementModel> advertisementDataList = <AdvertisementModel>[];
  AdvertisementDAO dao = AdvertisementDAO();
  /// Creates what we have to replace with the database.


  DataAdvertisementTest() {
    /*
    //  advertisementDAO DAO   = advertisementDAO();

    AdvertisementModel ad1 = AdvertisementModel(1, "assets/AdvertisementNetworks/video1.mp4");
    AdvertisementModel ad2 = AdvertisementModel(2, "assets/AdvertisementNetworks/video2.mp4");
    AdvertisementModel ad3 = AdvertisementModel(3, "assets/AdvertisementNetworks/video3.mp4");

    advertisementDataList.add(ad1);
    DAO.saveAdvertisement(ad1);

    advertisementDataList.add(ad2);
    DAO.saveAdvertisement(ad2);

    advertisementDataList.add(ad3);
    DAO.saveAdvertisement(ad3);
     */

  }

  Future<List<AdvertisementModel>>  getAdvertisementDataList() async {
    advertisementDataList = await dao.getListOfAdvertisements();
    return advertisementDataList;
  }
}

/// https://www.freemake.com/fr/free_video_downloader_top/
/// Link to download for free Youtube videos in line