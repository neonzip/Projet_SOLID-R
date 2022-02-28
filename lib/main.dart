import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/LaunchHome.dart';
import 'package:projet_solid_r/pages/SignIn.dart';
import 'package:projet_solid_r/pages/user/Activities.dart';
import 'package:projet_solid_r/pages/user/Favorites.dart';
import 'package:projet_solid_r/pages/user/MyInformation.dart';
import 'package:projet_solid_r/pages/user/ProjectDetailed.dart';
import 'package:projet_solid_r/pages/user/SignUp.dart';
import 'pages/user/Profile.dart';
import 'pages/user/FormalProjects.dart';
import 'pages/user/Home.dart';
import 'pages/user/Activities.dart';
import 'pages/user/Notifications.dart';
import 'pages/user/Favorites.dart';
import 'pages/user/MyInformation.dart';

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
    "/profile": (context) => const Profile(),
    "/projects/section=formal": (context) => const FormalProjects(),
    "/projects/section=formal" "/name=" "nomProjet": (context) => const ProjectDetailed(),

    "/notifications": (context) => const Notifications(),
  },
));

