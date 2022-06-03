import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataProjectTest.dart';
import 'package:projet_solid_r/pages/user/dao/DonationDAO.dart';
import 'package:projet_solid_r/pages/user/model/DonationModel.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../dao/UserDAO.dart';
import '../../model/ProjectModel.dart';

class DataUserTest {
  late List<UserModel> userdataList = <UserModel>[];

  DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataUserTest() {
    DataProjectTest projectDataLoad = DataProjectTest();
    UserDAO daoUser = UserDAO();
    UserModel userAdmin = UserModel(1,"NomAdministrateur", "admin@admin.fr", "password", true);
    UserModel userX = UserModel(2,"NomUtilisateur", "user@user.fr", "password", false);

    userAdmin.setUserPurse(100.80);
    userX.setUserPurse(340.53);

    userAdmin.setUserTotalDistance(500.67);
    userX.setUserTotalDistance(80.76);

    userAdmin.setUserTotalDonations(40.00);
    userX.setUserTotalDonations(23.40);

    userdataList.add(userAdmin);
    userdataList.add(userX);
    ProjectModel project1 = ProjectModel("1", true, "NameProject1", "1Ceci est un text pour décrire le but du projet1.");
    ProjectModel project2 = ProjectModel("2", true, "NameProject2", "2Ceci est un text pour décrire le but du projet2.");
    userX.userLikedProject.add(project1);
    userX.userLikedProject.add(project2);


    // users make donations to projects
     userX.donateToproject(1,1, 5.5); // parameters : idDonation / idProject /sum
     userX.donateToproject(2,2, 6.01);
     userAdmin.donateToproject(3,1, 10.1);
     userAdmin.donateToproject(4,2, 5.01);
    // see donations
    DonationDAO donDao = DonationDAO();
      //this function returns a future map<string,double>
      // to test it we use print inside (will be removed later)
    donDao.nbOfUsersDonatedToEachProject(5);
    donDao.sumOfDonationsToEachMonth();

    daoUser.saveUser(userX);
    daoUser.saveUser(userAdmin);

    daoUser.getListOfUsers();
    daoUser.getUserLikedProjectsByUserId(userX.userID);


  }
}