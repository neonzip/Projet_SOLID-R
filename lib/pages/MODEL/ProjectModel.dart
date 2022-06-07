import 'package:projet_solid_r/pages/MODEL/AdvertisementModel.dart';

import 'AssociationModel.dart';
import 'EntityModel.dart';
import 'PictureModel.dart';

/// Class of one instance of project.
class ProjectModel {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late String projectID;             // Project's ID
  late String projectName;        // Project's name
  late String projectDescription; // Project's description
  late double projectDonationGoal;// Project's goal for donation
  late double projectResult;      // Project's progression
  late String projectResultDescription; // Project's result description when it is finished
  late DateTime projectStartDate; // Date when the project begins
  late DateTime projectEndDate; // Date when the project ends

  // By default, none of the project is favorite
  bool projectIsFavorite = false;    // True if it is a favorite project, false then

  late List<PictureModel> projectPictures = <PictureModel>[];
  late AssociationModel projectAssociation;   // Association of the project
  late EntityModel projectEntity;      // Entity which collaborates for this project

  /// Constructor
  ProjectModel(String idProject, String nameProject, String descriptionProject) {
    projectID = idProject;
    projectName = nameProject;
    projectDescription = descriptionProject;
    projectResultDescription = "";
    projectResult = 0;

    projectDonationGoal=0.0;
    projectStartDate=DateTime(0);
    projectEndDate = DateTime(0);
    projectPictures =<PictureModel>[];
    projectAssociation=AssociationModel("-1","","","",AdvertisementModel("-1",""),"");
    projectEntity= EntityModel("-1","","",AdvertisementModel("-1",""));
  }

  ProjectModel.fromJson(Map<dynamic, dynamic> json)
      : projectID = json['projectID'] as String,
        projectName = json['projectName'] as String,
        projectDescription = json['projectDescription'] as String,
        projectDonationGoal = double.parse(json['projectDonationGoal'] as String),
        projectResult = double.parse(json['projectResult'] as String),
        projectResultDescription =  json['projectResultDescription'] as String,
        projectStartDate = DateTime.parse( json['projectStartDate'] as String),
        projectEndDate = DateTime.parse( json['projectStartDate'] as String),

        // disclaimer : the following attributes will be retreived in DAO
        projectAssociation =  AssociationModel(json['projectAssociationId'] as String,"","","",AdvertisementModel("0",""),""),
        projectEntity = EntityModel(json['projectEntityId'] as String,"","",AdvertisementModel("0","")),
        projectPictures = <PictureModel>[];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'projectID' : projectID.toString(),
    'projectName': projectName.toString(),
    'projectDescription': projectDescription.toString(),
    'projectDonationGoal':  projectDonationGoal.toString(),
    'projectResult': projectResult.toString(),
    'projectResultDescription': projectResultDescription.toString(),
    'projectStartDate': projectStartDate.toString(),
    'projectAssociationId' : projectAssociation.getAssociationId().toString(),
    'projectEntityId' : projectEntity.getEntityId().toString(),
    'projectEndDate' : projectEndDate.toString(),
    //the list of pictures will be saved in Dao.
  };

  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

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
  String getIdProject() {
    return projectID;
  }
  setIdProject(String id) {
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
  AssociationModel getProjectAssociation() {
    return projectAssociation;
  }
  setProjectAssociation(AssociationModel association) {
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

  List<PictureModel> getProjectPictures(){
    return projectPictures;
  }

  void setProjectPictures(List<PictureModel> ls){
    projectPictures=ls;
  }
}