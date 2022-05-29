import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/Portrait/PortraitProjectDetailedView.dart';

import '../OneProject/OverView/ProjectView.dart';


class PortraitProjectsView extends StatefulWidget {
  final ProjectModel project;

  const PortraitProjectsView({Key? key, required this.project}) : super(key: key);

  @override
  _PortraitProjectsViewState createState() => _PortraitProjectsViewState();
}
class _PortraitProjectsViewState extends State<PortraitProjectsView> {

  @override
  Widget build(BuildContext context) {
    return PortraitProjectDetailedView(project: widget.project);
  }
}