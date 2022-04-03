import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/Activity.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/HistoryActivity.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/SolidarityProjects.dart';
import 'package:projet_solid_r/pages/user/view/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/Activities.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/Favorites.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/FormalProjects.dart';
import 'package:projet_solid_r/pages/user/view/Home.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/MyInformation.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/Notifications.dart';
import 'package:projet_solid_r/pages/user/bazar/Profile/Profile.dart';
import 'package:projet_solid_r/pages/SignUp.dart';
import 'package:projet_solid_r/pages/user/view/Profile/APropos.dart';
import 'pages/user/bazar/Activity/Activities.dart';

void main() => runApp(
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
    "/myInformation": (context) => const MyInformation(),
    "/APropos": (context) => const APropos(),
    "/home": (context) => const Home(),
    "/favorites": (context) => const Favorites(),
    "/activities": (context) => const Activities(),
    "/activityAxel": (context) => const Activity(),
    "/activityHistory": (context) => const HistoryActivity(),
    "/profile": (context) => const Profile(),
    "/projects/section=formal": (context) => const FormalProjects(),
    "/projects/section=solidarity": (context) => const SolidarityProjects(),

    "/notifications": (context) => const Notifications(),
  },
));

