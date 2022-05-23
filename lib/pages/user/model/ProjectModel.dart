import 'AssociationModel.dart';
import 'EntityModel.dart';
import 'PictureModel.dart';

/// Class of one instance of project.
class ProjectModel {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late int projectID;             // Project's ID
  late String projectName;        // Project's name
  late String projectDescription; // Project's description
  late double projectDonationGoal;// Project's goal for donation
  late double projectResult;      // Project's progression
  late String projectResultDescription; // Project's result description when it is finished
  late DateTime projectStartDate; // Date when the project begins
  late bool projectIsFavorite;    // True if it is a favorite project, false then
  late List<ProjectModel> projectPictures =[];
  late AssociationModel projectAssociation;   // Association of the project
  late EntityModel projectEntity;      // Entity which collaborates for this project

  /// Constructor
  ProjectModel(int idProject, bool isFavorite, String nameProject, String descriptionProject) {
    projectID = idProject;
    projectName = nameProject;
    projectDescription = descriptionProject;
    projectResultDescription = "";
    projectIsFavorite = isFavorite;
    projectResult = 0;
  }

  ProjectModel.fromJson(Map<dynamic, dynamic> json)
      : projectID = int.parse(json['projectID'] as String),
        projectName = json['projectName'] as String,
        projectDescription = json['projectDescription'] as String,
        projectDonationGoal = double.parse(json['projectDonationGoal'] as String),
        projectResult = double.parse(json['projectResult'] as String),
        projectResultDescription =  json['projectResultDescription'] as String,
        projectStartDate = DateTime.parse( json['projectStartDate'] as String),
        projectIsFavorite = json['projectIsFavorite'];
        //projectAssociation = AssociationModel.fromJson(json),
        // projectEntity = EntityModel.fromJson(json),
        //projectPictures = PictureModel.fromJson(json);

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'projectID' : projectID.toString(),
    'projectName': projectName,
    'projectDescription': projectDescription,
    'projectDonationGoal':  projectDonationGoal.toString(),
    'projectResult': projectResult.toString(),
    'projectResultDescription': projectResultDescription,
    'projectStartDate': projectStartDate.toString(),
    'projectIsFavorite': projectIsFavorite.toString()
   // 'projectAssociation' : projectAssociation.toJson(),
   // 'projectEntity' : projectEntity.toJson(),
  // 'projectPictures' = projectPictures.toJson();
  };
  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

  /// ///////////////////////////
  bool getFavoriteState() {
    return projectIsFavorite;
  }
  setFavoriteState(bool state) {
    projectIsFavorite = state;
  }

  /// ///////////////////////////
  String getNameProject() {
    return projectName;
  }
  setNameProject(String name) {
    projectName = name;
  }

  /// ///////////////////////////
  int getIdProject() {
    return projectID;
  }
  setIdProject(int id) {
    projectID = id;
  }

  /// ///////////////////////////
  String getDescriptionProject() {
    return projectDescription;
  }
  setDescriptionProject(String description) {
    projectDescription = description;
  }

  /// ////////////////////////////
  double getDonationGoalProject() {
    return projectDonationGoal;
  }
  setDonationGoalProject(double goal) {
    projectDonationGoal = goal;
  }

  /// /////////////////////////////
  double getResultProject() {
    return projectResult;
  }
  setResultProject(double result) {
    projectResult = result;
  }

  /// /////////////////////////////
  AssociationModel getAssociationProject() {
    return projectAssociation;
  }
  setAssociationProject(AssociationModel association) {
    projectAssociation = association;
  }

  /// /////////////////////////////
  EntityModel getEntityProject() {
    return projectEntity;
  }
  setEntityProject(EntityModel entity) {
    projectEntity = entity;
  }

  /// /////////////////////////////
  String getResultDescriptionProject() {
    return projectResultDescription;
  }
  setResultDescriptionProject(String resultDescription) {
    projectResultDescription = resultDescription;
  }
}