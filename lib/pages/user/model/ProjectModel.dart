import 'AssociationModel.dart';
import 'EntityModel.dart';

/// Class of one instance of project.
class ProjectModel {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late int projectID;             // Project's ID
  late String projectName;        // Project's name
  late String projectDescription; // Project's description
  late String projectDonationGoal;// Project's goal for donation

  late double projectResult;      // Project's progression
  late String projectResultDescription; // Project's result description when it is finished

  late DateTime projectStartDate; // Date when the project begins

  late bool projectIsFavorite;    // True if it is a favorite project, false then

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
  String getDonationGoalProject() {
    return projectDonationGoal;
  }
  setDonationGoalProject(String goal) {
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