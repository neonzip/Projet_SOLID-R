import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

class DataUserTest {
  late List<UserModel> userdataList = <UserModel>[];

  DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataUserTest() {
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
  }
}