class AdvertisementModel {
  late int advertisementID;
  late String advertisementURL;

  AdvertisementModel(int adID, String adURL) {
    advertisementID = adID;
    advertisementURL = adURL;
  }
  AdvertisementModel.fromJson(Map<dynamic, dynamic> json)
      : advertisementID = int.parse(json['advertisementID'] as String),
        advertisementURL = json['advertisementURL'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'advertisementID': advertisementID.toString(),
    'advertisementURL': advertisementURL
};
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

