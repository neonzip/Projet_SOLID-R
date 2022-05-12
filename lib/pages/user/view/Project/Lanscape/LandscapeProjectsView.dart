import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

import 'LandscapeProjectDetailedView.dart';


class LandscapeProjectsView extends StatefulWidget {
  final ProjectModel project;

  const LandscapeProjectsView({Key? key, required this.project}) : super(key: key);


  @override
  _LandscapeProjectsViewState createState() => _LandscapeProjectsViewState();
}

class _LandscapeProjectsViewState extends State<LandscapeProjectsView> {
  @override
  Widget build(BuildContext context) {
    return LandscapeProjectDetailedView(project: widget.project);
  }
}