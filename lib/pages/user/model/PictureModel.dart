
/// Class of one instance of picture.
class PictureModel {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late int pictureID;             // picture's ID
  late String pictureURL;        // picture's URL
  late String pictureDescription; // picture's description


  /// Constructor
  PictureModel(int pictureID,String pictureURL, String pictureDescription) {
    pictureID = pictureID;
    pictureURL = pictureURL;
    pictureDescription = pictureDescription;
  }

  PictureModel.fromJson(Map<dynamic, dynamic> json)
      : pictureID = json['pictureID'],
        pictureURL = json['pictureURL'],
        pictureDescription= json['pictureDescription'];


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'pictureID': pictureID.toString(),
    'pictureURL': pictureURL.toString(),
    'pictureDescription': pictureDescription.toString(),

  };
  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

  String getPictureURL() {
    return pictureURL;
  }
  setPictureURL(String url) {
    pictureURL = url;
  }

  /// ///////////////////////////
 int getIdPicture() {
    return pictureID;
  }
  setIdProject(int id) {
    pictureID = id;
  }

  /// ///////////////////////////
  String getPictureDescription() {
    return pictureDescription;
  }
  setDescriptionPicture(String description) {
    pictureDescription = description;
  }

}