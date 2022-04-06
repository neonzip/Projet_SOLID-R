import 'package:flutter/material.dart';
import 'package:projet_solid_r/Test_Health.dart';
import 'package:projet_solid_r/pages/HealthApp.dart';
import 'package:projet_solid_r/pages/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn.dart';
import 'package:projet_solid_r/pages/user/Activities.dart';
import 'package:projet_solid_r/pages/user/Favorites.dart';
import 'package:projet_solid_r/pages/user/MyInformation.dart';
import 'package:projet_solid_r/pages/user/view/ProjectDetailed.dart';
import 'package:projet_solid_r/pages/SignUp.dart';
import 'package:projet_solid_r/pages/user/view/SolidarityProjects.dart';
import 'pages/user/Profile.dart';
import 'pages/user/FormalProjects.dart';
import 'pages/user/Home.dart';
import 'pages/user/Activities.dart';
import 'pages/user/Notifications.dart';
import 'pages/user/Favorites.dart';
import 'pages/user/MyInformation.dart';
import 'pages/user/view/SolidarityProjects.dart';
import 'pages/Activity.dart';
import 'Test_Health.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
    fontFamily: "Metropolis",
  ),
  initialRoute: "/",
  routes: {
    "/": (context) => const LaunchHome(),
    "/signup": (context) => const SignUp(),
    "/signin": (context) => const SignIn(),
    "/myInformation": (context) => const MyInformation(),
    "/home": (context) => const Home(),
    "/favorites": (context) => const Favorites(),
    "/activities": (context) => const Activities(),
    "/activities/activity": (context) => const Activity(),
    "/activities/activity/DailyStepsScreen": (context) => DailyStepsScreen(),
    "/profile": (context) => const Profile(),
    "/projects/section=formal": (context) => const FormalProjects(),
    "/projects/section=solidarity": (context) => const SolidarityProjects(),
    "/projects/section=formal" "/name=" "nomProjet": (context) => const ProjectDetailed(),

  },
));

