import 'package:firebase_database/firebase_database.dart';
import '../model/ProjectModel.dart';
import '../controller/Database.dart';
class ProjectDAO {
  late DatabaseReference _projectRef = FirebaseDatabase.instance.ref().child('Project');

  DataBase db = DataBase();

  ProjectDAO(){
    _projectRef = db.db.ref().child('Project');
  }

  /*
  * This function takes a sport as a parameter and
  * uses the DatabaseReference to save the JSON activity
  * to your Realtime Database.
  *
  */

  Future<void> saveProject(ProjectModel project) async {
    _projectRef = db.db.ref().child('Project/'+project.getIdProject().toString());
    await _projectRef.set(project.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getProjectQuery() {
    return _projectRef;
  }

  Future<ProjectModel> getProjectByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final projectSnapshot = await ref.child('Project/'+ id.toString()).get();
    final json = projectSnapshot.value as Map<dynamic, dynamic>;
    final projectOBJ = ProjectModel.fromJson(json);
    print('Data : ${projectSnapshot.value}');
    //test
    print('Dataaaaaaaaaaaaaa : ${projectOBJ.projectName}  ');
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