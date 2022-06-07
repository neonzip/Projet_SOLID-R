import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/SignUp/SignUpView.dart';
import 'package:projet_solid_r/pages/admin/View/AddProject/AddingProject.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/HistoryActivityPortrait.dart';
import 'package:projet_solid_r/pages/user/view/Profile/Notifications/NotificationsLandscape.dart';
import 'package:projet_solid_r/pages/user/controller/Authentification.dart';
import 'package:projet_solid_r/pages/user/controller/Database.dart';
import 'package:projet_solid_r/pages/LaunchHome/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn/SignInView.dart';
import 'package:projet_solid_r/pages/user/view/Profile/APropos/AProposPortrait.dart';
import 'pages/user/controller/Authentification.dart';

void main() async {

  /// Connaction to Firabase.
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  AuthentificationService _auth = AuthentificationService();
  await _auth.signIn("sport.solidr.test@gmail.com", "abmmtijm");
  DataBase db = DataBase();


  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    fontFamily: "Metropolis",
  ),
  initialRoute: "/",

  routes: {
        // TODO : Get the user token and if the user token is OK, avoid the connexion in order to make him access directly to his home page.
    "/": (context) => const LaunchHome(),
    "/signup": (context) => const SignUpView(),
    "/signin": (context) => const SignInView(),


    /////////////////////////////////////////////////////////////
    ////////////////////////// USER /////////////////////////////
    /////////////////////////////////////////////////////////////

    "/user/APropos": (context) => const AProposPortrait(),

    // TODO : Make the activity history specific for one user.
    // TODO : Do the same for the notifications
    "/user/activityHistory": (context) => const HistoryActivityPortrait(),
    "/user/notifications": (context) => const NotificationsLandscape(),

    /////////////////////////////////////////////////////////////
    ////////////////////////// ADMIN ////////////////////////////
    /////////////////////////////////////////////////////////////

    /* FORM TO ADD PROJET */
    "/admin/project/add": (context) => const AddingProject(),

  },
));}

