import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/Activity.dart';
import 'package:projet_solid_r/pages/admin/View/AddProject/AddingProject.dart';
import 'package:projet_solid_r/pages/admin/HomeAdmin.dart';
import 'package:projet_solid_r/pages/admin/View/Projects/ListProjectViewAdmin.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/HistoryActivity.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/SolidarityProjects.dart';
import 'package:projet_solid_r/pages/user/controller/Authentification.dart';
import 'package:projet_solid_r/pages/user/controller/Database.dart';
import 'package:projet_solid_r/pages/user/view/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/Activities.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/Favorites.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/FormalProjects.dart';
import 'package:projet_solid_r/pages/user/view/HomeUser.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/MyInformation.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/Notifications.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/Profile.dart';
import 'package:projet_solid_r/pages/SignUp.dart';
import 'package:projet_solid_r/pages/user/view/Profile/APropos.dart';
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
    "/signup": (context) => const SignUp(),
    "/signin": (context) => const SignIn(),


    /////////////////////////////////////////////////////////////
    ////////////////////////// USER /////////////////////////////
    /////////////////////////////////////////////////////////////

    /* HOME */
    "/user/home": (context) => const HomeUser(),

    /* PROFILE */
    "/user/profile": (context) => const Profile(),
    "/user/myInformation": (context) => const MyInformation(),
    "/user/APropos": (context) => const APropos(),
    "/user/activityHistory": (context) => const HistoryActivity(),
    "/user/notifications": (context) => const Notifications(),

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
    "/admin/home": (context) => const HomeAdmin(),

    /* PROJECTS */
    "/admin/projects": (context) => ListProjectViewAdmin(),

    /* FORMULAIRE D'AJOUT PROJET */
    "/admin/project/add": (context) => const AddingProject(),
  },
));}

