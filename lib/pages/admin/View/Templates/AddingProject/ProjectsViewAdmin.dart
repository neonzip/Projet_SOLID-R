import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/View/Projects/ProjectViewAdmin.dart';

class ProjectsViewAdmin extends StatefulWidget {
  final List<ProjectViewAdmin>? listProjects;
  final Widget filter;
  final bool isExpandedFilter;
  final ScrollController controller;

  const ProjectsViewAdmin({Key? key, required this.listProjects, required this.filter, required this.isExpandedFilter, required this.controller}) : super(key: key);

  @override
  _ProjectsViewAdminState createState() => _ProjectsViewAdminState();
}
class _ProjectsViewAdminState extends State<ProjectsViewAdmin> {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
          width: 700,
          child: CustomScrollView(
              controller: widget.controller,
              slivers: <Widget>[
                SliverAppBar(
                    floating:false,
                    automaticallyImplyLeading: false,
                    elevation: 2,
                    pinned: true,
                    collapsedHeight: widget.isExpandedFilter? 190 : 60,
                    backgroundColor: Colors.white,
                    forceElevated: true,
                    flexibleSpace:
                    /* Adding filter to the app. */
                    SingleChildScrollView(
                      child: widget.filter,
                    )
                ),

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