
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class UserModel {
  late int userID;
  late String userNickName;
  late String userEmail;
  late int userPurse;
  late int userTotalDistance;
  late int userTotalDonations;
  late bool userIsAdmin;

  late String userToken;
  late String password;

  late List<ProjectModel> userLikedProject;
}