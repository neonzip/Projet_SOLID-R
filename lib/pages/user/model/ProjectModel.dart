import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/AssociationModel.dart';

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
  late String donationGoalProject;// Project's goal for donation
  late String resultProject;      // Project's result when it is finished
  late DateTime startDateProject; // Date when the project begins
  late bool isFavoriteProject;    // True if it is a favorite project, false then

  late AssociationModel associationProject;   // Association of the project
  late EntityModel entityProject;      // Entity which collaborates for this project

  late BuildContext context;      // Context we need to redirect to the detailled page of the project

  /// Constructor
  ProjectModel(int idProject, bool isFavorite, BuildContext contextProject, String nameProject, String descriptionProject) {
    projectID = idProject;
    projectName = nameProject;
    projectDescription = descriptionProject;

    isFavoriteProject = isFavorite;

    associationProject = AssociationModel();
    entityProject = EntityModel();

    context = contextProject;
  }


  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

  /// ///////////////////////////
  bool getFavoriteState() {
    return isFavoriteProject;
  }
  setFavoriteState(bool state) {
    isFavoriteProject = state;
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
    return donationGoalProject;
  }
  setDonationGoalProject(String goal) {
    donationGoalProject = goal;
  }

  /// /////////////////////////////
  String getResultProject() {
    return resultProject;
  }
  setResultProject(String result) {
    resultProject = result;
  }

  /// /////////////////////////////
  AssociationModel getAssociationProject() {
    return associationProject;
  }
  setAssociationProject(AssociationModel association) {
    associationProject = association;
  }

  /// /////////////////////////////
  EntityModel getEntityProject() {
    return entityProject;
  }
  setEntityProject(EntityModel entity) {
    entityProject = entity;
  }
}