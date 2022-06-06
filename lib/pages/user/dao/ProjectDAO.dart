import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/user/model/DonationModel.dart';
import 'package:projet_solid_r/pages/user/model/PictureModel.dart';
import '../model/ProjectModel.dart';
import '../controller/Database.dart';
import 'associationDAO.dart';
import 'entityDAO.dart';

class ProjectDAO {
  late DatabaseReference _projectRef = FirebaseDatabase.instance.ref().child('Project');
  DataBase db = DataBase();

  ProjectDAO(){
    _projectRef = db.db.ref().child('Project');
  }

  Future<void> saveProject(ProjectModel project) async {
    _projectRef = db.db.ref().child('Project/'+project.getIdProject().toString());
    await _projectRef.set(project.toJson());
    /* important Note :
    *  when we save the Project in the database
    *  we only save the attributes that have a primitive type
    *  we only save the id of the attributes that are objects
    *  except for the list of pictures since each picture belongs to that project only.
    * */
    /* Be careful when you retreive the object from the database !*/
    //saving the list of pictures into the project :
    project.projectPictures.forEach((elt) {
      var ref = db.db.ref().child('Project/'+project.projectID.toString()+'/projectPictures/'+elt.pictureID.toString());
      ref.set( elt.toJson());
    });
  }

  Query getProjectQuery() {
    return _projectRef;
  }


  /// Gets a project with its ID.
  Future<ProjectModel> getProjectByID(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    final projectSnapshot = await ref.child('Project/'+ id.toString()).get();
    final json = projectSnapshot.value as Map<dynamic, dynamic>;
    final projectOBJ = ProjectModel.fromJson(json);

    /* we have to retreive the project association*/
    associationDAO assocDao = associationDAO();
    String idAsso = projectOBJ.getProjectAssociation().getAssociationId();
    projectOBJ.setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

    /* we have to retreive the project entity*/
    entityDAO entityDao = entityDAO();
    String idEntity = projectOBJ.getEntityProject().getEntityId();
    projectOBJ.setEntityProject(await entityDao.getEntityByID(idEntity));

    /* we have to retreive the project pictures*/
    final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
          for (var picture in projectPicturesSnopshot.children) {
            var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
            projectOBJ.projectPictures.add(pictureOBJ);
          }

    return projectOBJ;
  }

  /// Remove a project in the database.
  deleteById(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/'+ id.toString()).remove();
  }

  /// Update a project in the database.
  updateProject(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/' + project.projectID.toString()).update(
        {
          "projectAssociationId" : project.projectAssociation.entityID.toString(),
          "projectDescription" : project.projectDescription,
          "projectDonationGoal" : project.projectDonationGoal.toString(),
          "projectEntityId" : project.projectEntity.entityID.toString(),
          "projectID" : project.projectID.toString(),
          "projectName" : project.projectName,
          "projectResult" : project.projectResult.toString(),
          "projectResultDescription" : project.projectResultDescription,
          "projectStartDate" : project.projectStartDate.toString(),
        }
    );
  }

  /// Change the progress of the donation of one project.
  setDonationState(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/' + project.projectID.toString()).update(
        {
          "projectResult" : project.projectResult.toString(),
        }
    );
  }

  /// Add a project in the database.
  addProject(ProjectModel project) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('Project/').push();
    project.projectID = newRef.key!;
    newRef.set(project.toJson());
  }


  /// Gets the list of all the projects.
  Future<List<ProjectModel>> getListOfProjects() async {

    final List<ProjectModel> list = <ProjectModel>[];
    final projectsSnapshot = await FirebaseDatabase.instance.ref('Project').get();

    for (var project in projectsSnapshot.children) {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      list.add(projectOBJ);
    }


    // update projects associations && projects entities
    associationDAO assocDao = associationDAO();
    entityDAO entityDao = entityDAO();

    for(int i =0; i<list.length;i++) {
      // update project association
      String idAsso = list[i].getProjectAssociation().getAssociationId();
      list[i].setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));
      // update project entitie
      String idEntity = list[i].getEntityProject().getEntityId();
      list[i].setEntityProject(await entityDao.getEntityByID(idEntity));

      // retreiving project pictures :
      list[i].projectPictures= <PictureModel>[];
      String id = list[i].getIdProject();
      final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
      for (var picture in projectPicturesSnopshot.children) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        list[i].projectPictures.add(pictureOBJ);

      }
    }
    return list;
  }

  /// Gets the list of all the projects that the user hade given some money.
  /// In fact, it is a list a formal projects.
  Future<List<ProjectModel>> getListOfFormalProjects(String userId) async {
    /// Gets the list of the donations made by the user in order to have the id of the formal projects.
    final List<DonationModel> listDonations = <DonationModel>[];
    final donationsSnapshot = await FirebaseDatabase.instance.ref('Donation').get();
    for (var donation in donationsSnapshot.children) {
      var donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>);
      listDonations.add(donationOBJ);
    }


    /// Gets the list of all the projects.
    final List<ProjectModel> list = <ProjectModel>[];
    final projectsSnapshot = await FirebaseDatabase.instance.ref('Project').get();
    for (var project in projectsSnapshot.children) {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      list.add(projectOBJ);
    }

    /// Gets only the list of the formal projects.
    final List<ProjectModel> listFormalProjects = <ProjectModel>[];
    for (var project in list) {
      for (var donation in listDonations) {
        /// If it is a formal project, we add it to the list, then we do nothing.
        if (donation.projectID == project.projectID) {
          listFormalProjects.add(project);
          break;
        }
      }
    }

    // update projects associations && projects entities
    associationDAO assocDao = associationDAO();
    entityDAO entityDao = entityDAO();

    for(int i =0; i<listFormalProjects.length;i++) {
      // update project association
      String idAsso = listFormalProjects[i].getProjectAssociation().getAssociationId();
      listFormalProjects[i].setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

      // update project entitie
      String idEntity = listFormalProjects[i].getEntityProject().getEntityId();
      listFormalProjects[i].setEntityProject(await entityDao.getEntityByID(idEntity));

      // TODO: Change the code below.
      // retreiving project pictures :
      listFormalProjects[i].projectPictures= <PictureModel>[];
      String id = listFormalProjects[i].getIdProject();
      final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
      for (var picture in projectPicturesSnopshot.children) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        listFormalProjects[i].projectPictures.add(pictureOBJ);

      }
    }
    return listFormalProjects;
  }

  /// Gets the list of the user's favorite projects.
  Future<List<ProjectModel>> getLikedProjects(String userId) async {
    final List<ProjectModel> list = <ProjectModel>[];
    final projectsSnapshot = await FirebaseDatabase.instance.ref('User/' + userId + '/userLikedProject').get();
    for (var project in projectsSnapshot.children) {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      projectOBJ.projectIsFavorite = true;

      list.add(projectOBJ);
    }
    // update projects associations && projects entities
    associationDAO assocDao = associationDAO();
    entityDAO entityDao = entityDAO();

    for(int i =0; i<list.length;i++) {
      // update project association
      String idAsso = list[i].getProjectAssociation().getAssociationId();
      list[i].setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

      // update project entitie
      String idEntity = list[i].getEntityProject().getEntityId();
      list[i].setEntityProject(await entityDao.getEntityByID(idEntity));

      // retreiving project pictures :
      list[i].projectPictures= <PictureModel>[];
      String id = list[i].getIdProject();
      final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/$id/projectPictures').get();
      for (var picture in projectPicturesSnopshot.children) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        list[i].projectPictures.add(pictureOBJ);

      }
    }
    return list;
  }

  /// Gets the list of all the projects, including the favorite projects of the user.
  /// In fact, gets all of them, and when the project is one of the favorite projects of the user, we make it favorite in the view.
  Future<List<ProjectModel>> getListOfProjectsWithFavorite(String userId) async {

    /// Gets the list of the favorite projects of the user
    final List<ProjectModel> listFavorite = <ProjectModel>[];
    final favoritesProjectsSnapshot = await FirebaseDatabase.instance.ref('User/' + userId + '/userLikedProject').get();

    for (var project in favoritesProjectsSnapshot.children) {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      listFavorite.add(projectOBJ);
    }

    /// Gets the list of all projects
    final List<ProjectModel> list = <ProjectModel>[];

    final projectsSnapshot = await FirebaseDatabase.instance.ref('Project').get();
    int i = 0;
    for (var project in projectsSnapshot.children) {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      for (var favoriteProject in listFavorite) {
        if (favoriteProject.projectID == projectOBJ.projectID) {


          projectOBJ.projectIsFavorite = true;    //  This project is favorite
        }
      }
      list.add(projectOBJ);
    }

    // update projects associations && projects entities
    associationDAO assocDao = associationDAO();

    entityDAO entityDao = entityDAO();

    for(int i = 0; i < list.length;i++) {
      // update project association
      String idAsso = list[i].getProjectAssociation().getAssociationId();
      list[i].setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

      // update project entitie
      String idEntity = list[i].getEntityProject().getEntityId();
      list[i].setEntityProject(await entityDao.getEntityByID(idEntity));

      // retreiving project pictures :
      list[i].projectPictures= <PictureModel>[];
      String id = list[i].getIdProject();
      final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
      projectPicturesSnopshot.children.forEach((picture) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        list[i].projectPictures.add(pictureOBJ);

      });
    }
    return list;
  }
}