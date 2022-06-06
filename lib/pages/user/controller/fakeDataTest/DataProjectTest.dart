import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/dao/ProjectDAO.dart';
import '../../../admin/view/Projects/ProjectViewAdmin.dart';
import '../../view/Project/OneProject/OverView/ProjectView.dart';

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
  ProjectDAO projectDao = ProjectDAO();

  /// Creates what we have to replace with the database.
  DataProjectTest() {
    /*
    // Loads data for entity
    DataEntityTest entitiesMecene = DataEntityTest();

    // Loads data for association
    DataAssociationTest association = DataAssociationTest();

    // Specific to data project
    ProjectModel project1 = ProjectModel("1", true, "NameProject1",
        "1Ceci est un text pour décrire le but du projet1.");
    ProjectModel project2 = ProjectModel("2", true, "NameProject2",
        "2Ceci est un text pour décrire le but du projet2.");
    ProjectModel project3 = ProjectModel("3", false, "NameProject3",
        "3Ceci est un text pour décrire le but du projet3.");
    ProjectModel project4 = ProjectModel("4", true, "NameProject4",
        "4Ceci est un text pour décrire le but du projet4.");
    ProjectModel project5 = ProjectModel("5", true, "NameProject5",
        "5Ceci est un text pour décrire le but du projet5.");
    ProjectModel project6 = ProjectModel("6", true, "NameProject6",
        "6Ceci est un text pour décrire le but du projet6.");
    ProjectModel project7 = ProjectModel("7", false, "NameProject7",
        "7Ceci est un text pour décrire le but du projet7.");
    ProjectModel project8 = ProjectModel("8", true, "NameProject8",
        "8Ceci est un text pour décrire le but du projet8.");
    /////////
    project1.setResultProject(9756);
    project2.setResultProject(1268);
    project3.setResultProject(870.50);
    project4.setResultProject(8100);
    project5.setResultProject(1000);
    project6.setResultProject(5023);
    project7.setResultProject(7451);
    project8.setResultProject(358);
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

    ProjectDAO projectDao = ProjectDAO();
    projectDao.saveProject(project1);
    projectDao.saveProject(project2);
    projectDao.saveProject(project3);
    projectDao.saveProject(project4);
    projectDao.saveProject(project5);
    projectDao.saveProject(project6);
    projectDao.saveProject(project7);
    projectDao.saveProject(project8);
    */
  }


  /// Gets the list of all the solidarity projects (Future Version).
  Future<List<ProjectModel>> getListFutureSolidarityProjects() async {
    solidarityProjectdataList = await projectDao.getListOfProjects();
    return solidarityProjectdataList;
  }

  /// Creates and gets the list of all the names of solidarity projects (future).
  Future<List<ProjectView>> getListFutureSolidarityProjectsViews() async {
    List<ProjectView> list = <ProjectView>[];
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      ProjectView projectView = ProjectView(
        project: solidarityProjectdataList.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the names of solidarity projects (future) with the favorite projects of the user.
  Future<List<ProjectView>> getListFutureSolidarityProjectsViewsWithFavorite(String userId) async {
    List<ProjectView> list = <ProjectView>[];
    print("okkkk");

    solidarityProjectdataList = await projectDao.getListOfProjectsWithFavorite(userId);
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      ProjectView projectView = ProjectView(
        project: solidarityProjectdataList.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }


  /// Creates and gets the list of all the names of formal projects. (future>
  Future<List<ProjectView>> getListFutureFormalProjectsViews(String userId) async {
    List<ProjectView> list = <ProjectView>[];
    formalProjectdataList = await projectDao.getListOfFormalProjects(userId);
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      ProjectView projectView = ProjectView(
        project: formalProjectdataList.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the names of solidarity projects for the admin part.
  Future<List<ProjectViewAdmin>> getListFutureSolidarityProjectsViewsAdmin() async {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: solidarityProjectdataList.elementAt(i),
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

  /// Gets the list of all the formal projects. (future)
  Future<List<ProjectModel>> getListFutureFormalProjects(String userId) async {
    formalProjectdataList = await projectDao.getListOfFormalProjects(userId);
    return formalProjectdataList;
  }

  /// Creates and gets the list of all the finished formal projects.
  List<ProjectModel> getListFinishedFormalProjects() {
    List<ProjectModel> listFinishedFormalProjects = <ProjectModel>[];
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      if (formalProjectdataList.elementAt(i).getResultProject() ==
          formalProjectdataList.elementAt(i).getDonationGoalProject()) {
        listFinishedFormalProjects.add(formalProjectdataList.elementAt(i));
      }
    }
    return listFinishedFormalProjects;
  }


  /// Creates and gets the list of all the finished formal projects.
  List<ProjectModel> getListFinishedSolidarityProjects() {
    List<ProjectModel> listFinishedSolidarityProjects = <ProjectModel>[];
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList.elementAt(i).getResultProject() ==
          solidarityProjectdataList.elementAt(i).getDonationGoalProject()) {
        listFinishedSolidarityProjects.add(solidarityProjectdataList.elementAt(i));
      }
    }
    return listFinishedSolidarityProjects;
  }

  /// Creates and gets the list of all the finished formal projects.
  Future<List<ProjectModel>> getListFutureFinishedFormalProjects(String userId) async {
    List<ProjectModel> listFinishedFormalProjects = <ProjectModel>[];
    formalProjectdataList = await projectDao.getListOfFormalProjects(userId);
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      if (formalProjectdataList.elementAt(i).getResultProject() ==
          formalProjectdataList.elementAt(i).getDonationGoalProject()) {
        listFinishedFormalProjects.add(formalProjectdataList.elementAt(i));
      }
    }
    return listFinishedFormalProjects;
  }

  /// Creates and gets the list of all the finished solidarity projects.
  Future<List<ProjectModel>> getListFutureFinishedSolidarityProjects() async {
    List<ProjectModel> listFinishedProjects = <ProjectModel>[];
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList.elementAt(i).getResultProject() ==
          solidarityProjectdataList.elementAt(i).getDonationGoalProject()) {
        listFinishedProjects.add(solidarityProjectdataList.elementAt(i));
      }
    }
    return listFinishedProjects;
  }


  /// Gets the list of all the favorite solidarity projects of the user.
  Future<List<ProjectModel>> getListFutureFavoriteSolidarityProjects(String userId) async {
    List<ProjectModel> listFavoriteProjects = <ProjectModel>[];
    solidarityProjectdataList = await projectDao.getLikedProjects(userId);//getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
        listFavoriteProjects.add(solidarityProjectdataList.elementAt(i));
    }
    return listFavoriteProjects;
  }

  /// Gets the list of all the formal projects that are not finished.
  Future<List<ProjectModel>> getListFutureRunningFormalProjects(String userId) async {
    List<ProjectModel> listRunningFormalProjects = <ProjectModel>[];
    formalProjectdataList = await projectDao.getListOfFormalProjects(userId);
    for (int i = 0; i < formalProjectdataList.length; i ++) {
      if (formalProjectdataList.elementAt(i).getResultProject() <
          formalProjectdataList.elementAt(i).getDonationGoalProject()) {
        listRunningFormalProjects.add(formalProjectdataList.elementAt(i));
      }
    }
    return listRunningFormalProjects;
  }


  /// Gets the list of all the solidarity projects that are not finished, for the admin part.
  Future<List<ProjectModel>> getListFutureRunningSolidarityProjects() async {
    List<ProjectModel> listRunningProjects = <ProjectModel>[];
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList.elementAt(i).getResultProject() <
          solidarityProjectdataList.elementAt(i).getDonationGoalProject()) {
        listRunningProjects.add(solidarityProjectdataList.elementAt(i));
      }
    }

    return listRunningProjects;
  }

  Future<ProjectModel?> getFutureFormalProject(String idProject) async {
    formalProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < formalProjectdataList.length; i++) {
      if (formalProjectdataList
          .elementAt(i)
          .projectID == idProject) {
        return formalProjectdataList.elementAt(i);
      }
    }
    return null;
  }

  Future<ProjectModel?> getFutureSolidarityProject(String idProject) async {
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i++) {
      if (solidarityProjectdataList
          .elementAt(i)
          .projectID == idProject) {
        return solidarityProjectdataList.elementAt(i);
      }
    }
    return null;
  }


  /// Creates and gets the list of all the finished formal projects.
  Future<List<ProjectView>> getListFutureFinishedFormalProjectsViews(String userId) async {
    List<ProjectView> list = <ProjectView>[];
    List<ProjectModel> listFutureFinishedFormalProjects = await getListFutureFinishedFormalProjects(userId);
    for (int i = 0; i < listFutureFinishedFormalProjects.length; i ++) {
      ProjectView projectView = ProjectView(
        project: listFutureFinishedFormalProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the finished solidarity projects.
  Future<List<ProjectView>> getListFutureFinishedSolidarityProjectsViews() async {
    List<ProjectView> list = <ProjectView>[];
    List<ProjectModel> listFutureFinishedFormalProjects = await getListFutureFinishedSolidarityProjects();
    for (int i = 0; i < listFutureFinishedFormalProjects.length; i ++) {
      ProjectView projectView = ProjectView(
        project: listFutureFinishedFormalProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the finished formal projects for the admin part.
  List<ProjectViewAdmin> getListFinishedFormalProjectsViewsAdmin() {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    for (int i = 0; i < getListFinishedFormalProjects().length; i ++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: getListFinishedFormalProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the finished solidarity projects for the admin part.
  List<ProjectViewAdmin> getListFinishedSolidarityProjectsViewsAdmin() {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    for (int i = 0; i < getListFinishedFormalProjects().length; i ++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: getListFinishedFormalProjects().elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }


  /// Creates and gets the list of all the finished formal projects for the admin part.Future
  Future<List<ProjectViewAdmin>> getListFutureFinishedSolidarityProjectsViewsAdmin() async {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    List<ProjectModel> listFinishedSolidarityProjects = await getListFutureFinishedSolidarityProjects();
    for (int i = 0; i < listFinishedSolidarityProjects.length; i ++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: listFinishedSolidarityProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }


  /// Creates and gets the list of all the running formal projects.
  Future<List<ProjectView>> getListFutureRunningFormalProjectsViews(String userId) async {
    List<ProjectView> list = <ProjectView>[];

    List<ProjectModel> listRunningFormalProjects = await getListFutureRunningFormalProjects(userId);
    for (int i = 0; i < listRunningFormalProjects.length; i ++) {
      ProjectView projectView = ProjectView(
        project: listRunningFormalProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }


  /// Creates and gets the list of all the running solidarity projects for the admin part.
  Future<List<ProjectViewAdmin>> getListFutureRunningSolidarityProjectsViewsAdmin() async {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    List<ProjectModel> listRunningSolidarityProjects = await getListFutureRunningSolidarityProjects();
    for (int i = 0; i < listRunningSolidarityProjects.length; i ++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: listRunningSolidarityProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the favorite solidarity projects of the user.
  Future<List<ProjectView>> getListFutureFavoriteSolidarityProjectsViews(String userId) async {
    List<ProjectView> list = <ProjectView>[];
    List<ProjectModel> listFutureFavoriteSolidarityProjects = await getListFutureFavoriteSolidarityProjects(userId);
    for (int i = 0; i < listFutureFavoriteSolidarityProjects.length; i ++) {
      ProjectView projectView = ProjectView(
        project: listFutureFavoriteSolidarityProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }

  /// Creates and gets the list of all the solidarity projects, publicated and not for the admin part.
  Future<List<ProjectViewAdmin>> getListFutureAllProjectsViewsAdmin() async {
    List<ProjectViewAdmin> list = <ProjectViewAdmin>[];
    List<
        ProjectModel> listFutureSolidarityProjects = await getListFutureSolidarityProjects();
    for (int i = 0; i < listFutureSolidarityProjects.length; i++) {
      ProjectViewAdmin projectView = ProjectViewAdmin(
        project: listFutureSolidarityProjects.elementAt(i),
        contribution: 0,
      );
      list.add(projectView);
    }
    return list;
  }


  /// Creates and gets the list of all the solidarity projects of a specific association.
  Future<List<ProjectView>> getListFutureSolidarityProjectsOfAssociationViews(
      String associationID) async {
    List<ProjectView> list = <ProjectView>[];
    solidarityProjectdataList = await projectDao.getListOfProjects();
    for (int i = 0; i < solidarityProjectdataList.length; i ++) {
      if (solidarityProjectdataList[i].projectAssociation.entityID ==
          associationID) {
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