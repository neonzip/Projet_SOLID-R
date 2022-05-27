import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../dao/UserDAO.dart';
import '../../model/ProjectModel.dart';

class DataUserTest {
  late List<UserModel> userdataList = <UserModel>[];

  DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataUserTest() {
    UserDAO daoUser = UserDAO();
    UserModel userAdmin = UserModel(1,"NomAdministrateur", "admin@admin.fr", "password", true);
    UserModel userX = UserModel(2,"NomUtilisateur", "user@user.fr", "password", false);

    userAdmin.setUserPurse(100.80);
    userX.setUserPurse(34.53);

    userAdmin.setUserTotalDistance(500.67);
    userX.setUserTotalDistance(80.76);

    userAdmin.setUserTotalDonations(40.00);
    userX.setUserTotalDonations(23.40);

    userdataList.add(userAdmin);
    userdataList.add(userX);
    ProjectModel project1 = ProjectModel(1, true, "NameProject1", "1Ceci est un text pour décrire le but du projet1.");
    ProjectModel project2 = ProjectModel(2, true, "NameProject2", "2Ceci est un text pour décrire le but du projet2.");
    userX.userLikedProject.add(project1);
    userX.userLikedProject.add(project2);


    daoUser.saveUser(userX);
    UserModel? u = daoUser.getUserByID(userX.userID);

    if(u!=null){
      print("ggg" + u.userID.toString()  +u.userTotalDistance.toString());
      u.userLikedProject.forEach((e) {  print(e.projectName);});
    }

    List<UserModel> L = daoUser.getListOfUsers();
    if(L!=null){
       L.forEach((e) {  print(e.userEmail);});
    }

  }
}