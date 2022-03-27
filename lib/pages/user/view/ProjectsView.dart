import 'package:flutter/material.dart';

import 'ProjectView.dart';

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Constants for every possible status to list the Projects (easier and communicates with the filters.
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const int statusAllFormal = 0;            // To get the list of all formal projects
const int statusAllSolidarity = 1;        // To get the list of all solidarity projects
const int statusFavoriteSolidarity = 2;   // To get the list of the favorite solidarity projects
const int statusRunningFormal = 3;        // To get the list of running(not finished) formal projects
const int statusFinishedFormal = 4;       // To get the list of finished formal projects

class ProjectsView extends StatefulWidget {
  List<ProjectView>? listProjects;
  Widget filter;
  bool isExpandedFilter;
  ScrollController controller;

  ProjectsView({Key? key, required this.listProjects, required this.filter, required this.isExpandedFilter, required this.controller}) : super(key: key);

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
                      title: widget.listProjects?.elementAt(index).projectTemplate(),
                    ),
                    childCount: widget.listProjects?.length,
                  ),
                )
              ]
          )
      );
  }
}