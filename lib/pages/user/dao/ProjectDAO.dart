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
    int idAsso = projectOBJ.getProjectAssociation().getAssociationId();
    projectOBJ.setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

    /* we have to retreive the project entity*/
    entityDAO entityDao = entityDAO();
    int identity = projectOBJ.getEntityProject().getEntityId();
    projectOBJ.setEntityProject(await entityDao.getEntityByID(identity));

    /* we have to retreive the project pictures*/
    final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
          projectPicturesSnopshot.children.forEach((picture)
          {
            var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
            projectOBJ.projectPictures.add(pictureOBJ);
          });

    return projectOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/'+ id.toString()).remove();
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
      int idAsso = list[i].getProjectAssociation().getAssociationId();
      list[i].setProjectAssociation(await  assocDao.getAssociationyByID(idAsso));

      // update project entitie
      int identity = list[i].getEntityProject().getEntityId();
      list[i].setEntityProject(await entityDao.getEntityByID(identity));

      // retreiving project pictures :
      list[i].projectPictures= <PictureModel>[];
      int id = list[i].getIdProject();
      final projectPicturesSnopshot =  await FirebaseDatabase.instance.ref().child('Project/'+ id.toString()+'/projectPictures').get();
      projectPicturesSnopshot.children.forEach((picture) {
        var pictureOBJ = PictureModel.fromJson(picture.value as Map<dynamic, dynamic>);
        list[i].projectPictures.add(pictureOBJ);

      });
    }
    return list;
  }


}