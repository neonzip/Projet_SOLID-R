import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import 'LandscapeProjectDetailedView.dart';


class LandscapeProjectsView extends StatefulWidget {
  final ProjectModel project;
  final UserModel user;

  const LandscapeProjectsView({Key? key, required this.project, required this.user}) : super(key: key);


  @override
  _LandscapeProjectsViewState createState() => _LandscapeProjectsViewState();
}

class _LandscapeProjectsViewState extends State<LandscapeProjectsView> {
  @override
  Widget build(BuildContext context) {
    return LandscapeProjectDetailedView(project: widget.project, user: widget.user,);
  }
}