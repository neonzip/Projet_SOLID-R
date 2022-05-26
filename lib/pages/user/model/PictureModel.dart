
/// Class of one instance of picture.
class PictureModel {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late int pictureID;             // picture's ID
  late String pictureURL;        // picture's URL
  late String pictureDescription; // picture's description
  late int projectID; // picture of project with id= projectID

  /// Constructor
  PictureModel(int pictureID,String pictureURL, String pictureDescription,int projectID) {
    pictureID = pictureID;
    pictureURL = pictureURL;
    pictureDescription = pictureDescription;
    projectID = projectID;
  }

  PictureModel.fromJson(Map<dynamic, dynamic> json)
      : pictureID = json['pictureID'],
        pictureURL = json['pictureURL'],
        pictureDescription= json['pictureDescription'],
        projectID = json['projectID'];


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'pictureID': pictureID.toString(),
    'pictureURL': pictureURL.toString(),
    'pictureDescription': pictureDescription.toString(),
    'projectID' : projectID.toString(),
  };
  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

  /// ///////////////////////////

  /// ///////////////////////////
  String getpictureURL() {
    return pictureURL;
  }
  setpictureURL(String url) {
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