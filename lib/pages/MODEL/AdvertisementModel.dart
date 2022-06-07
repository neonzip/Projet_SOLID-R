class AdvertisementModel {
  late String advertisementID;
  late String advertisementURL;

  AdvertisementModel(String adID, String adURL) {
    advertisementID = adID;
    advertisementURL = adURL;
  }
  AdvertisementModel.fromJson(Map<dynamic, dynamic> json)
      : advertisementID = json['advertisementID'] as String,
        advertisementURL = json['advertisementURL'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'advertisementID': advertisementID.toString(),
    'advertisementURL': advertisementURL
};
  /// /////////////////////////////
  String getAdvertisementID() {
    return advertisementID;
  }

  setAdvertisementID(String ID) {
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

