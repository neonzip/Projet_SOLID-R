import 'package:projet_solid_r/pages/user/model/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/user/dao/advertisementDAO.dart';
class DataAdvertisementTest {
  late List<AdvertisementModel> advertisementDataList = <AdvertisementModel>[];
  advertisementDAO dao = advertisementDAO();
  /// Creates what we have to replace with the database.


  DataAdvertisementTest() {
  //  advertisementDAO dao   = advertisementDAO();
/*
    AdvertisementModel ad1 = AdvertisementModel(1, "assets/AdvertisementNetworks/video1.mp4");
    AdvertisementModel ad2 = AdvertisementModel(2, "assets/AdvertisementNetworks/video2.mp4");
    AdvertisementModel ad3 = AdvertisementModel(3, "assets/AdvertisementNetworks/video3.mp4");

    advertisementDataList.add(ad1);
    dao.saveAdvertisement(ad1);

    advertisementDataList.add(ad2);
    dao.saveAdvertisement(ad2);

    advertisementDataList.add(ad3);
    dao.saveAdvertisement(ad3);
*/
  }

  Future<List<AdvertisementModel>>  getAdvertisementDataList() async {
    advertisementDataList = await dao.getListOfAdvertisements();
    return advertisementDataList;
  }
}


/// https://www.freemake.com/fr/free_video_downloader_top/
/// Link to download for free Youtube videos in line