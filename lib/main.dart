import 'package:flutter/material.dart';
import 'pages/Profile.dart';
import 'pages/Projects.dart';
import 'pages/Home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    fontFamily: "Metropolis",
  ),
  initialRoute: "/home",
  routes: {
    "/home": (context) => Home(),
    "/profile": (context) => Profile(),
    "/projects": (context) => Projects(),
  },
));

