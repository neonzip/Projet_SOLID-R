class AdvertisementModel {
  late int advertisementID;
  late String advertisementURL;

  AdvertisementModel(int adID, String adURL) {
    advertisementID = adID;
    advertisementURL = adURL;
  }

  /// /////////////////////////////
  int getAdvertisementID() {
    return advertisementID;
  }
  setAdvertisementID(int ID) {
    advertisementID = ID;
  }

  /// /////////////////////////////
  String getAdvertisementURL() {
    return advertisementURL;
  }
  setAdvertisementURL(String URL) {
    advertisementURL = URL;
  }
} 