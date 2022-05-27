import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/Activity.dart';
import 'package:projet_solid_r/pages/SignUp/SignUpView.dart';
import 'package:projet_solid_r/pages/admin/View/AddProject/AddingProject.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/HistoryActivityPortrait.dart';
import 'package:projet_solid_r/pages/user/view/Profile/Notifications/NotificationsLandscape.dart';
import 'package:projet_solid_r/pages/user/view/Project/SolidarityProject/SolidarityProjects.dart';
import 'package:projet_solid_r/pages/user/controller/Authentification.dart';
import 'package:projet_solid_r/pages/user/controller/Database.dart';
import 'package:projet_solid_r/pages/user/view/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn/SignInView.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/Activities.dart';
import 'package:projet_solid_r/pages/user/view/Project/SolidarityProject/Favorites.dart';
import 'package:projet_solid_r/pages/user/view/Profile/APropos/AProposPortrait.dart';
import 'package:projet_solid_r/pages/user/view/Project/FormalProject/FormalProjects.dart';
import 'pages/user/bazar/Activity/Activities.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  AuthentificationService _auth = AuthentificationService();
  await _auth.signIn("sport.solidr.test@gmail.com", "abmmtijm");
  DataBase db = DataBase();
  db.SetData("UserSettings", "hi !!!!!!");
  db.GetData("UserSettings");
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    fontFamily: "Metropolis",
  ),
  initialRoute: "/",
  routes: {
    "/": (context) => const LaunchHome(),
    "/signup": (context) => const SignUpView(),
    "/signin": (context) => const SignInView(),


    /////////////////////////////////////////////////////////////
    ////////////////////////// USER /////////////////////////////
    /////////////////////////////////////////////////////////////

    /* HOME */
    //"/user/home": (context) => const HomeUser(),

    /* PROFILE */
    //"/user/profile": (context) => const Profile(),
    //"/user/myInformation": (context) => const MyInformation(),
    "/user/APropos": (context) => const AProposPortrait(),
    "/user/activityHistory": (context) => const HistoryActivityPortrait(),
    "/user/notifications": (context) => const NotificationsLandscape(),

    /* PROJECTS */
    "/user/favorites": (context) => const Favorites(),
    "/user/projects/section=formal": (context) => const FormalProjects(),
    "/user/projects/section=solidarity": (context) => const SolidarityProjects(),

    /* ACTIVITIES */
    "/user/activities": (context) => const Activities(),
    "/user/activityAxel": (context) => const Activity(),


    /////////////////////////////////////////////////////////////
    ////////////////////////// ADMIN ////////////////////////////
    /////////////////////////////////////////////////////////////

    /* HOME */
    //"/admin/home": (context) => const HomeAdmin(),

    /* PROJECTS */
    //"/admin/projects": (context) => const ListProjectViewAdmin(),

    /* FORM TO ADD PROJET */
    "/admin/project/add": (context) => const AddingProject(),

    /* PROFIL */
    //"/admin/profile": (context) => const ProfileAdmin(),

  },
));}

