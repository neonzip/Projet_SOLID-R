import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataAdvertisementTest.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

class DataUserTest {
  late List<UserModel> userdataList = <UserModel>[];

  DataAdvertisementTest dataAdvertisementTest = DataAdvertisementTest();

  /// Creates what we have to replace with the database.
  DataUserTest() {
    UserModel userAdmin = UserModel("NomAdministrateur", "admin@admin.fr", "password", true);
    UserModel userX = UserModel("NomUtilisateur", "user@user.fr", "password", false);


    userdataList.add(userAdmin);
    userdataList.add(userX);
  }
}