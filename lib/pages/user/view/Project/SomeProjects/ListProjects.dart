import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/Lanscape/LandscapeProjectView.dart';
import 'package:projet_solid_r/pages/user/view/Project/OneProject/OverView/ProjectView.dart';

import '../../Home/ContainerWithBackground.dart';

typedef ItemSelectedCallback = Null Function(int value);

class ListProjects extends StatefulWidget {
  final UserModel user;
  final List<ProjectView>? listProjects;

  //final String project;
  final int count;
  final ItemSelectedCallback onItemSelected;

  const ListProjects({Key? key, required this.listProjects, required this.count, required this.onItemSelected, required this.user}) : super(key: key);


  @override
  _ListProjectsState createState() => _ListProjectsState();
}

class _ListProjectsState extends State<ListProjects> {
  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).size.width < 600) ?
      ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child:ProjectView(
                project: widget.listProjects!.elementAt(position).project,
                contribution: 0,
                user: widget.user,
              )
            ),
        )
        ;
      },
    )
    :
    ContainerWithBackground(content: ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            color: Colors.white.withOpacity(0.9),
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: LandscapeProjectView(
                project: widget.listProjects!.elementAt(position).project,
                contribution: 0,
              ),
            ),
          ),
        );
      },
    ));
  }
}