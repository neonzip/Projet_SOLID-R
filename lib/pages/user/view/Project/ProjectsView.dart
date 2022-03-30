import 'package:flutter/material.dart';

import 'ProjectView.dart';

class ProjectsView extends StatefulWidget {
  final List<ProjectView>? listProjects;
  final Widget filter;
  final bool isExpandedFilter;
  final ScrollController controller;

  const ProjectsView({Key? key, required this.listProjects, required this.filter, required this.isExpandedFilter, required this.controller}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}
class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: const Color(0xFFD7E1FF),
          width: 500,
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