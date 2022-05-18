
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class UserModel {
  late int userID;
  late String userNickName;
  late String userEmail;
  late double userPurse = 0.0;
  late double userTotalDistance = 0.0;
  late double userTotalDonations = 0.0;
  late bool userIsAdmin;

  late String userToken;
  late String password;

  late List<ProjectModel> userLikedProject;


  UserModel(String name, String email, String pw, bool isAdmin) {
    userNickName = name;
    userEmail = email;
    password = pw;
    userIsAdmin = isAdmin;
  }

  /// ////////////////////////////
  int getUserID(){
    return userID;
  }
  setUserID(int id) {
    userID = id;
  }

  /// ////////////////////////////
  String getUserNickName(){
    return userNickName;
  }
  setUserNickName(String pseudo) {
    userNickName = pseudo;
  }

  /// ////////////////////////////
  String getUserMail(){
    return userEmail;
  }
  setUserMail(String mail) {
    userEmail = mail;
  }

  /// ////////////////////////////
  double getUserPurse(){
    return userPurse;
  }
  setUserPurse(double purse) {
    userPurse = purse;
  }

  /// ////////////////////////////
  double getUserTotalDistance(){
    return userPurse;
  }
  setUserTotalDistance(double distance) {
    userTotalDistance = distance;
  }

  /// ////////////////////////////
  double getUserTotalDonations(){
    return userPurse;
  }
  setUserTotalDonations(double donation) {
    userTotalDonations = donation;
  }

  /// ////////////////////////////
  bool getUserIsAdmin(){
    return userIsAdmin;
  }
  setUserIsAdmin(bool isOk) {
    userIsAdmin = isOk;
  }

  /// ////////////////////////////
  String getUserToken(){
    return userToken;
  }
  setUserToken(String token) {
    userToken = token;
  }

  /// ////////////////////////////
  String getUserPassword(){
    return password;
  }
  setUserPassword(String pw) {
    password = pw;
  }
}