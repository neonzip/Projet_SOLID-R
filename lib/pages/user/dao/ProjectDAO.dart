import 'package:firebase_database/firebase_database.dart';
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

  Future<ProjectModel> getProjectByID(int id) async {
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
          projectPicturesSnopshot.children.forEach((picture)
          {
            var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
            projectOBJ.projectPictures.add(pictureOBJ);
          });

    return projectOBJ;
  }

  deleteById(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/'+ id.toString()).remove();
  }

  updateProject(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/' + project.projectID.toString()).update(
        {
          "projectAssociationId" : project.projectAssociation.entityID.toString(),
          "projectDescription" : project.projectDescription,
          "projectDonationGoal" : project.projectDonationGoal.toString(),
          "projectEntityId" : project.projectEntity.entityID.toString(),
          "projectID" : project.projectID.toString(),
          "projectIsFavorite" : project.projectIsFavorite,
          "projectName" : project.projectName,
          "projectResult" : project.projectResult.toString(),
          "projectResultDescription" : project.projectResultDescription,
          "projectStartDate" : project.projectStartDate.toString(),
        }
    );
  }

  setFavoriteState(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/' + project.projectID.toString()).update(
        {
          "projectIsFavorite" : project.projectIsFavorite,
        }
    );
  }

  setDonationState(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/' + project.projectID.toString()).update(
        {
          "projectResult" : project.projectResult,
        }
    );
  }

  addProject(ProjectModel project) async {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('Project/').push();
    project.projectID = newRef.key!;
    newRef.set(project.toJson());
  }


  Future<List<ProjectModel>> getListOfProjects() async {

    final List<ProjectModel> list = <ProjectModel>[];
    final projectsSnapshot = await FirebaseDatabase.instance.ref('Project').get();
    projectsSnapshot.children.forEach((project) async {
      var projectOBJ = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      list.add(projectOBJ);
    });

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
      projectPicturesSnopshot.children.forEach((picture) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        list[i].projectPictures.add(pictureOBJ);

      });
    }
    return list;
  }


}