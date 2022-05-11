import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAssociationTest.dart';
import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataEntityTest.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

import '../../../admin/View/Projects/ProjectViewAdmin.dart';
import '../../view/Project/ProjectView.dart';

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Constants for every possible status to list the Projects (easier and communicates with the filters.
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const int statusAllFormal = 0;            // To get the list of all formal projects
const int statusAllSolidarity = 1;        // To get the list of all solidarity projects
const int statusFavoriteSolidarity = 2;   // To get the list of the favorite solidarity projects
const int statusRunningFormal = 3;        // To get the list of running(not finished) formal projects
const int statusFinishedFormal = 4;       // To get the list of finished formal projects
/// //////////////////////////////////////////////////////:

class DataProjectTest {

  // Specific to project
  late List<ProjectModel> formalProjectdataList = <ProjectModel>[];
  late List<ProjectModel> solidarityProjectdataList = <ProjectModel>[];
  late int statusSection;

  /// Creates what we have to replace with the database.
  DataProjectTest() {
    // Loads data for entity
    DataEntityTest entitiesMecene = DataEntityTest();

    // Loads data for association
    DataAssociationTest association = DataAssociationTest();

    // Specific to data project
    ProjectModel project1 = ProjectModel(1, true, "NameProject1", "1Ceci est un text pour décrire le but du projet1.");
    ProjectModel project2 = ProjectModel(2, true, "NameProject2", "2Ceci est un text pour décrire le but du projet2.");
    ProjectModel project3 = ProjectModel(3, false, "NameProject3",  "3Ceci est un text pour décrire le but du projet3.");
    ProjectModel project4 = ProjectModel(4, true, "NameProject4", "4Ceci est un text pour décrire le but du projet4.");
    ProjectModel project5 = ProjectModel(5, true, "NameProject5", "5Ceci est un text pour décrire le but du projet5.");
    ProjectModel project6 = ProjectModel(6, true, "NameProject6", "6Ceci est un text pour décrire le but du projet6.");
    ProjectModel project7 = ProjectModel(7, false, "NameProject7",  "7Ceci est un text pour décrire le but du projet7.");
    ProjectModel project8 = ProjectModel(8, true, "NameProject8", "8Ceci est un text pour décrire le but du projet8.");
    /////////
    project1.setResultProject(97.5);
    project2.setResultProject(12.6);
    project3.setResultProject(100);
    project4.setResultProject(63.9);
    project5.setResultProject(91.5);
    project6.setResultProject(12.0);
    project7.setResultProject(100);
    project8.setResultProject(35.9);
    /////////
    project1.projectDonationGoal = 10000.50;
    project2.projectDonationGoal = 1400.00;
    project3.projectDonationGoal = 870.50;
    project4.projectDonationGoal = 8540.00;
    project5.projectDonationGoal = 1950.50;
    project6.projectDonationGoal = 10068.00;
    project7.projectDonationGoal = 8970.50;
    project8.projectDonationGoal = 3500.50;
    /////////
    project1.projectEntity = entitiesMecene.entitydataList.elementAt(0);
    project2.projectEntity = entitiesMecene.entitydataList.elementAt(1);
    project3.projectEntity = entitiesMecene.entitydataList.elementAt(2);
    project4.projectEntity = entitiesMecene.entitydataList.elementAt(0);
    project5.projectEntity = entitiesMecene.entitydataList.elementAt(1);
    project6.projectEntity = entitiesMecene.entitydataList.elementAt(2);
    project7.projectEntity = entitiesMecene.entitydataList.elementAt(0);
    project8.projectEntity = entitiesMecene.entitydataList.elementAt(1);
    /////////
    project1.projectAssociation = association.assoDataList.elementAt(0);
    project2.projectAssociation = association.assoDataList.elementAt(1);
    project3.projectAssociation = association.assoDataList.elementAt(2);
    project4.projectAssociation = association.assoDataList.elementAt(0);
    project5.projectAssociation = association.assoDataList.elementAt(1);
    project6.projectAssociation = association.assoDataList.elementAt(2);
    project7.projectAssociation = association.assoDataList.elementAt(0);
    project8.projectAssociation = association.assoDataList.elementAt(1);
    /////////
    project7.setResultDescriptionProject("Description résultat 7");

    formalProjectdataList.add(project1);
    formalProjectdataList.add(project2);
    formalProjectdataList.add(project3);
    formalProjectdataList.add(project4);

    solidarityProjectdataList.add(project5);
    solidarityProjectdataList.add(project6);
    solidarityProjectdataList.add(project7);
    solidarityProjectdataList.add(project8);
  }

  /// Gets the list of all the solidarity projects.
  List<ProjectModel> getListSolidarityProjects() {
    return solidarityProjectdataList;
  }

  /// Creates and gets the list of all the names of solidarity projects.
  List<ProjectView> getListSolidarityProjectsViews() {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      ProjectView projectView = ProjectView(
          project: solidarityProjectdataList.elementAt(i),
          contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the names of formal projects.
  List<ProjectView> getListFormalProjectsViews() {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      ProjectView projectView = ProjectView(
          project: formalProjectdataList.elementAt(i),
          contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Gets the list of all the formal projects.
  List<ProjectModel> getListFormalProjects() {
    return formalProjectdataList;
  }

  /// Creates and gets the list of all the finished formal projects.
  List<ProjectModel> getListFinishedFormalProjects() {
    List<ProjectModel> listFinishedFormalProjects = <ProjectModel>[];
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      if (formalProjectdataList.elementAt(i).getResultProject() == 100) {
        listFinishedFormalProjects.add(formalProjectdataList.elementAt(i));
      }
    }
    return listFinishedFormalProjects;
  }

  /// Gets the list of all the favorite solidarity projects.
  List<ProjectModel> getListFavoriteSolidarityProjects() {
    List<ProjectModel> listFavoriteProjects = <ProjectModel>[];
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList.elementAt(i).getFavoriteState() == true) {
        listFavoriteProjects.add(solidarityProjectdataList.elementAt(i));
      }
    }
    return listFavoriteProjects;
  }

  /// Gets the list of all the formal projects that are not finished.
  List<ProjectModel> getListRunningFormalProjects() {
    List<ProjectModel> listRunningFormalProjects = <ProjectModel>[];
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      if (formalProjectdataList.elementAt(i).getResultProject() < 100) {
        listRunningFormalProjects.add(formalProjectdataList.elementAt(i));
      }
    }
    return listRunningFormalProjects;
  }

  /// Gets the list of the projects that we want to have.
  /// Selects the list we want and returns it.
  /// Useful for the filter for example, and to display the good view of projects in the pages.
  List<ProjectModel>? getListProjects() {
    switch (statusSection) {
      case statusAllFormal:
        return getListFormalProjects();
      case statusAllSolidarity:
        return getListSolidarityProjects();
      case statusFavoriteSolidarity:
        return getListFavoriteSolidarityProjects();
      case statusFinishedFormal:
        return getListFinishedFormalProjects();
      case statusRunningFormal:
        return getListRunningFormalProjects();
      default:
        return null;
    }
  }

  ProjectModel? getFormalProject(int idProject) {
    for (int i = 0; i < formalProjectdataList.length; i++) {
      if (formalProjectdataList.elementAt(i).projectID == idProject) {
        return formalProjectdataList.elementAt(i);
      }
    }
    return null;
  }
  ProjectModel? getSolidarityProject(int idProject) {
    for (int i = 0; i < solidarityProjectdataList.length; i++) {
      if (solidarityProjectdataList.elementAt(i).projectID == idProject) {
        return solidarityProjectdataList.elementAt(i);
      }
    }
    return null;
  }

  /// Creates and gets the list of all the finished formal projects.
  List<ProjectView> getListFinishedFormalProjectsViews() {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < getListFinishedFormalProjects().length; i ++) {
      ProjectView projectView = ProjectView(
        project: getListFinishedFormalProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the running formal projects.
  List<ProjectView> getListRunningFormalProjectsViews() {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < getListRunningFormalProjects().length; i ++) {
      ProjectView projectView = ProjectView(
        project: getListRunningFormalProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the favorite solidarity projects.
  List<ProjectView> getListFavoriteSolidarityProjectsViews() {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < getListFavoriteSolidarityProjects().length; i ++) {
      ProjectView projectView = ProjectView(
        project: getListFavoriteSolidarityProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the solidarity projects, publicated and not for the admin part.
  List<ProjectViewAdmin> getListAllProjectsViewsAdmin() {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    for (int i = 0; i < getListSolidarityProjects().length; i++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: getListSolidarityProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the solidarity projects of a specific association.
  List<ProjectView> getListSolidarityProjectsOfAssociationViews(int associationID) {
    List<ProjectView> list = <ProjectView>[];
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList[i].projectAssociation.entityID == associationID) {
        ProjectView projectView = ProjectView(
          project: solidarityProjectdataList.elementAt(i),
          contribution: 0,
        );

        list.add(projectView);
      }
    }
    return list;
  }
}