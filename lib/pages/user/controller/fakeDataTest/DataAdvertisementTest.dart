import 'package:projet_solid_r/pages/user/model/AdvertisementModel.dart';
import 'package:projet_solid_r/pages/user/model/AssociationModel.dart';
class DataAdvertisementTest {
  late List<AdvertisementModel> advertisementDataList = <AdvertisementModel>[];

  /// Creates what we have to replace with the database.
  DataAdvertisementTest() {
    AdvertisementModel ad1 = AdvertisementModel(1, "assets/AdvertisementNetworks/video1.mp4");
    AdvertisementModel ad2 = AdvertisementModel(2, "assets/AdvertisementNetworks/video2.mp4");
    AdvertisementModel ad3 = AdvertisementModel(3, "assets/AdvertisementNetworks/video3.mp4");

    advertisementDataList.add(ad1);
    advertisementDataList.add(ad2);
    advertisementDataList.add(ad3);
  }
}

/// https://www.freemake.com/fr/free_video_downloader_top/
/// Link to download for free Youtube videos in line