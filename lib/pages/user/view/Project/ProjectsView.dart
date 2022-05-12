import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Project/Lanscape/LandscapeProjectsView.dart';
import 'package:projet_solid_r/pages/user/view/Project/Portrait/PortraitProjectsView.dart';
import 'ListProjects.dart';
import 'ProjectView.dart';

class ProjectsView extends StatefulWidget {
  final List<ProjectView>? listProjects;
  final int nbItemFilter;
  final Widget filter;
  final ScrollController controller;

  const ProjectsView({Key? key, required this.listProjects, required this.filter, required this.controller, required this.nbItemFilter}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}
class _ProjectsViewState extends State<ProjectsView> {
  var selectedValue = 0;
  var isLargeScreen = false;

  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (MediaQuery.of(context).size.width <= 600) ? AppBar(
        toolbarHeight: (isExpanded && widget.nbItemFilter == 3) ? kToolbarHeight + 64 : (isExpanded && widget.nbItemFilter == 2) ? kToolbarHeight + 32 : kToolbarHeight,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.only(top: 1),
          child: Row(
            children: [
              const Text("Filtrer", style: TextStyle(color: Color(0xFF0725A5))),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(isExpanded? Icons.arrow_drop_up : Icons.arrow_drop_down, color: const Color(0xFF0725A5),)
              )
            ],
          ),
        ),
          bottom: PreferredSize(
            child: Visibility(
              child: SingleChildScrollView(
                child: widget.filter,
              ),
              visible: isExpanded ? true : false,
            ),
            preferredSize: isExpanded ? const Size.fromHeight(kToolbarHeight) : const Size.fromHeight(0),
          ), //// widget.filter,
      ) : null,
      body: OrientationBuilder(builder: (context, orientation) {

        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(
            children: <Widget>[
          Expanded(
            child: ListProjects(
                 onItemSelected: (value) {
              if (isLargeScreen) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PortraitProjectsView(project: widget.listProjects!.elementAt(value).project);
                  },
                ));
              }
            },
              listProjects: widget.listProjects,
              count: widget.listProjects!.length,
            ),
          ),
          isLargeScreen ? Expanded(child: LandscapeProjectsView(project: widget.listProjects!.elementAt(selectedValue).project)) : Container(color: const Color(0xFF0725A5),),
        ]);
      }),
    );
  }
}