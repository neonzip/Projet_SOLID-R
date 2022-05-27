import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:marquee/marquee.dart';

import '../../../user/model/ProjectModel.dart';
import '../../../user/view/templates/Project/ProjectProgressBar.dart';
import 'ProjectCharts.dart';
import 'ProjectDetailedContentAdmin.dart';

class ProjectDetailedAdmin extends StatefulWidget {
  // Project projectToSee;
  final ProjectModel project;
  const ProjectDetailedAdmin({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectDetailedAdminState createState() => _ProjectDetailedAdminState();
}

/// Widget which only contains the participation part that you can see in the first container of the detailed project page.
class _ProjectDetailedAdminState extends State<ProjectDetailedAdmin> {

  Widget participationInformationTemplate() {
    double progress = (widget.project.projectResult * 100) / widget.project.projectDonationGoal;

    return Container (
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Column(
        children: [
          ProjectProgressBar(
            valueBar: progress / 100, // %
          ),
          Visibility(
              visible: (widget.project.projectDonationGoal != widget.project.projectResult),
              child: Container (
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Column(
                    children: [
                      Text("$progress % financés"),
                    ]
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget projectDetailedNavigation() {
    return
      DefaultTabController(
        length: (widget.project.projectResult == widget.project.projectDonationGoal)? 4 : 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 0,
            bottom : TabBar(
              labelStyle:const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              labelColor: Colors.white,
              indicator: BoxDecoration(
                color: const Color(0xFF0725A5),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(
                  child: Marquee(
                    showFadingOnlyWhenScrolling: true,
                    fadingEdgeStartFraction: 0.1,
                    fadingEdgeEndFraction: 0.5,
                    text: 'Projet',
                    blankSpace: 50.0,
                    pauseAfterRound: const Duration(seconds: 4),
                    accelerationDuration: const Duration(seconds: 2),
                    decelerationDuration: const Duration(milliseconds: 500),
                  ),
                ),
                Tab(
                    child: Marquee(
                      showFadingOnlyWhenScrolling: true,
                      fadingEdgeStartFraction: 0.1,
                      fadingEdgeEndFraction: 0.5,
                      text: 'Association',
                      blankSpace: 50.0,
                      pauseAfterRound: const Duration(seconds: 4),
                      accelerationDuration: const Duration(seconds: 2),
                      decelerationDuration: const Duration(milliseconds: 500),
                    )
                ),
                Tab(
                    child: Marquee(
                      showFadingOnlyWhenScrolling: true,
                      fadingEdgeStartFraction: 0.1,
                      fadingEdgeEndFraction: 0.5,
                      text: 'Mécène',
                      blankSpace: 50.0,
                      pauseAfterRound: const Duration(seconds: 4),
                      accelerationDuration: const Duration(seconds: 2),
                      decelerationDuration: const Duration(milliseconds: 500),
                    )
                ),
                if (widget.project.projectResult == widget.project.projectDonationGoal)
                  Tab(
                      child: Marquee(
                        showFadingOnlyWhenScrolling: true,
                        fadingEdgeStartFraction: 0.1,
                        fadingEdgeEndFraction: 0.5,
                        text: 'Résultats',
                        blankSpace: 50.0,
                        pauseAfterRound: const Duration(seconds: 4),
                        accelerationDuration: const Duration(seconds: 2),
                        decelerationDuration: const Duration(milliseconds: 500),
                      )
                  ),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  AutoSizeText(widget.project.projectDescription,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  AutoSizeText(widget.project.projectAssociation.entityDescription,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  AutoSizeText(widget.project.projectEntity.entityDescription,
                    textAlign: TextAlign.justify,
                  ),
                ),
                if (widget.project.projectResult == widget.project.projectDonationGoal)
                  Container(
                    padding: const EdgeInsets.all(10),
                    child:
                    AutoSizeText(widget.project.projectResultDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ),
              ]
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.yellow,
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white60,
              tabs: [
                Tab(text: "Statistiques"),
                Tab(text: "Projet",),
              ],
            ),
            backgroundColor: const Color(0xFF0725A5),
            title: Column (
              children: [
                const Text("Projet"),
                Text(widget.project.projectName,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              ProjectCharts(
                titre: "Nombre d'utilisateurs les 5 derniers mois",
                data: Map<String, double>(),
              ),
              ProjectDetailedContentAdmin(project: widget.project,),
            ],
          )
        )
    );
  }
}



