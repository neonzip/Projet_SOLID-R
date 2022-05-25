import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:projet_solid_r/pages/user/dao/PictureDAO.dart';
import 'package:projet_solid_r/pages/user/model/AssociationModel.dart';
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
    *  except for the list of pictures since each picture has the id of its project
    * */
    /* Be careful when you retreive the object from the database !*/
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
    int identity = projectOBJ.projectEntity.entityID;
    projectOBJ.setEntityProject(await entityDao.getEntityByID(identity));

    /* we have to retreive the project pictures*/
    PictureDAO picDAO = PictureDAO();

    return projectOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Project/'+ id.toString()).remove();
    //test
    print('Dataaaaaaa removed');
  }
/*
  Future<List<ProjectModel>> getListOfProjects() async {
    /* Map<String, Map<String, dynamic>> objectsGTypeInd = Map<String, Map<String, dynamic>>() {} as Map<String, Map<String, dynamic>>;
    Map<String, SportModel> objectHashMap = dataSnapShot.getValue(objectsGTypeInd);
    List<SportModel>  objectArrayList = <SportModel>[]; //(objectHashMap.values());
    */

    final List<ProjectModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('Project').get();
    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final project = ProjectModel.fromJson(value);
      list.add(project);
    });
    return list;

  }

 */
}