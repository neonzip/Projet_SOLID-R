
import 'dart:convert';

import 'package:projet_solid_r/pages/user/dao/DonationDAO.dart';
import 'package:projet_solid_r/pages/user/model/DonationModel.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

///!!!!!!!!!!!!!    likedProjects is not done yet
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


  UserModel(int id,String name, String email, String pw, bool isAdmin) {
    userID= id;
    userNickName = name;
    userEmail = email;
    userPurse =0.0;
    userTotalDistance = 0.0;
    userTotalDonations = 0.0;
    password = pw;
    userToken = "";
    userIsAdmin = isAdmin;
    userLikedProject = <ProjectModel>[];
  }


  UserModel.fromJson(Map<dynamic, dynamic> json)
      : userID = int.parse(json['userID'] as String),
        userNickName = json['userNickName'] as String,
        userEmail = json['userEmail'] as String,
        userPurse = double.parse(json['userPurse'] as String),
        userTotalDistance = double.parse(json['userTotalDistance'] as String),
        userTotalDonations = double.parse(json['userTotalDonations'] as String),
        userIsAdmin = json['userIsAdmin'] as bool,
        userToken = json['userToken'] as String,
        password = json['password'] as String,
        userLikedProject = <ProjectModel>[];


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'userID' : userID.toString(),
    'userNickName': userNickName.toString(),
    'userEmail': userEmail.toString(),
    'userPurse':  userPurse.toString(),
    'userTotalDistance':  userTotalDistance.toString(),
    'userTotalDonations':  userTotalDonations.toString(),
    'userIsAdmin':  userIsAdmin,
    'userToken':  userToken.toString(),
    'password':  password.toString(),


   };

  bool donateToproject(String idDonation, String idProject , double sum){
    DonationDAO donDao = DonationDAO();
    if(sum <= this.userPurse) {
      // to make things simple idDonation == idProject
      DonationModel don = DonationModel( idDonation,
          DateTime.now(), sum, this.userID, idProject);
      this.userPurse = this.userPurse - sum;
      donDao.saveDonation(don);
      return true;
    }
    return false;
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