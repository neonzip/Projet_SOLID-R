import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/Portrait/PortraitProjectDetailedView.dart';


class PortraitProjectsView extends StatefulWidget {
  final UserModel user;
  final ProjectModel project;

  const PortraitProjectsView({Key? key, required this.project, required this.user}) : super(key: key);

  @override
  _PortraitProjectsViewState createState() => _PortraitProjectsViewState();
}
class _PortraitProjectsViewState extends State<PortraitProjectsView> {

  @override
  Widget build(BuildContext context) {
    return PortraitProjectDetailedView(project: widget.project, user: widget.user,);
  }
}