import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:marquee/marquee.dart';
import 'package:projet_solid_r/pages/admin/view/UpdateProject/UpdatingProject.dart';
import 'package:projet_solid_r/pages/user/view/templates/Project/GlobalInformation.dart';
import 'package:projet_solid_r/pages/user/view/templates/Project/MeceneInformation.dart';

import '../../../user/model/ProjectModel.dart';
import '../../../user/view/templates/Project/ProjectProgressBar.dart';
import '../../../user/view/templates/Separator.dart';

class ProjectDetailedContentAdmin extends StatefulWidget {
  // Project projectToSee;
  final ProjectModel project;
  const ProjectDetailedContentAdmin({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectDetailedContentAdminState createState() => _ProjectDetailedContentAdminState();
}

/// Widget which only contains the participation part that you can see in the first container of the detailed project page.
class _ProjectDetailedContentAdminState extends State<ProjectDetailedContentAdmin> {

  Widget participationInformationTemplate() {
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
            valueBar: widget.project.projectResult / 100, // %
          ),
          const AutoSizeText(
            // TODO : Change the "XX" value by the real one.
              "Cagnotte remplie en " "XX" " jours",
              textAlign: TextAlign.center,
              maxLines: 2
          ),
        ],
      ),
    );
  }

  Widget projectDetailedNavigation() {
    return
      DefaultTabController(
        length: (widget.project.projectResult == 100)? 4 : 3,
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
                if (widget.project.projectResult == 100)
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
                if (widget.project.projectResult == 100)
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 30,
        backgroundColor: Colors.yellow,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> UpdatingProject(project: widget.project)));
            },
            child: const Text("Modifier", style: TextStyle(color: Color(0xFF0725A5))),

          ),
          const Spacer(),
          TextButton(
            onPressed: () {  },
            child: const Text("Supprimer", style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: SizedBox(
                width: 500,
                child: Column(
                  children: [

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          GlobalInformation(
                            project: widget.project,
                            goalDate: DateTime.now(),
                            onPressed: () {

                            },
                          ),
                          //globalInformationTemplate(),
                          participationInformationTemplate(),
                          MeceneInformation(project: widget.project),

                          /* Blue horizontal line separating the two parts of the main page. */
                          const Separator(),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            padding: const EdgeInsets.all(5),
                            child: projectDetailedNavigation(),
                          )
                        ],
                      ),
                    )
                  ],
                )
            )
        ),
      )
    );
  }
}





/*Scaffold(
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: Colors.yellow,
            leading: Row(
              mainAxisSize: MainAxisSize.max,
              children: [

                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> UpdatingProject(project: widget.project)));
                  },
                  child: const Text("Modifier", style: TextStyle(color: Color(0xFF0725A5))),

                ),
                const Spacer(),
                TextButton(
                  onPressed: () {  },
                  child: const Text("Supprimer", style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
          ),
          body: Center(
              child: SizedBox(
                  width: 500,
                  child: Column(
                    children: [

                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GlobalInformation(
                              project: widget.project,
                              goalDate: DateTime.now(),
                              onPressed: () {

                              },
                            ),
                            //globalInformationTemplate(),
                            participationInformationTemplate(),
                            MeceneInformation(project: widget.project),

                            /* Blue horizontal line separating the two parts of the main page. */
                            const Separator(),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 500,
                              padding: const EdgeInsets.all(5),
                              child: projectDetailedNavigation(),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
          ),
        )*/