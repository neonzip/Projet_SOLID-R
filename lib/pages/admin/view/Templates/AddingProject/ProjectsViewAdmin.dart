import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Projects/ProjectViewAdmin.dart';

class ProjectsViewAdmin extends StatefulWidget {
  final List<ProjectViewAdmin>? listProjects;
  final bool isExpandedFilter;
  final ScrollController controller;

  const ProjectsViewAdmin({Key? key, required this.listProjects, required this.isExpandedFilter, required this.controller}) : super(key: key);

  @override
  _ProjectsViewAdminState createState() => _ProjectsViewAdminState();
}
class _ProjectsViewAdminState extends State<ProjectsViewAdmin> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.blueAccent.withOpacity(0.2),
          width: 700,
          child: CustomScrollView(
              controller: widget.controller,
              slivers: <Widget>[

                /* Adding Cards to the app. To change with real function : Creation of many projects. */
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                      title: widget.listProjects?.elementAt(index),
                    ),
                    childCount: widget.listProjects?.length,
                  ),
                )
              ]
          )
      );
  }
}