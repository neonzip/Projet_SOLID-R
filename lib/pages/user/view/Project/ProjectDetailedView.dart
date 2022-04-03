import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:projet_solid_r/pages/user/view/templates/Project/GlobalInformation.dart';
import 'package:projet_solid_r/pages/user/view/templates/Project/MeceneInformation.dart';
import '../../model/ProjectModel.dart';
import '../templates/DonationButton.dart';
import '../templates/Project/ProjectProgressBar.dart';
import '../templates/Separator.dart';

class ProjectDetailed extends StatefulWidget {
 // Project projectToSee;
  final ProjectModel project;
  const ProjectDetailed({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectDetailedState createState() => _ProjectDetailedState();
}

/// Widget which only contains the participation part that you can see in the first container of the detailed project page.
class _ProjectDetailedState extends State<ProjectDetailed> {
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
          const AutoSizeText("Ma participation :",),
          const AutoSizeText("80 €",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
            ProjectProgressBar(
                valueBar: widget.project.projectResult / 100, // %
            ),
            const AutoSizeText(
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
                const Tab(text: 'Projet',),
                const Tab(text: 'Association',),
                const Tab(text: 'Mécène',),
                if (widget.project.projectResult == 100)
                const Tab(text: 'Résultats',),
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
        backgroundColor: const Color(0xFF0725A5),
        title: Column (
          children: [
            const Text("Projets soutenus"),
            Text(widget.project.projectName,
            style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
                width: 500,
                child: Column(
                  children: [
                    GlobalInformation(
                      project: widget.project,
                      goalDate: DateTime.now(),
                      onPressed: showDonationDialog,
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
                )
            )
        ),
      )
    );
  }

  void showDonationDialog() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Container(
              alignment: Alignment.center,
              child: const Text(
                "Don réalisé !",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: SingleChildScrollView(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const Text(
                      "Félicitation, vous avez donné " "1.08" "€ au projet ! "
                          "\n\nContinuez d'enregistrer vos activités sportives pour soutenir d'autres projets.",
                    ),
                  ),
                  (widget.project.projectResult < 100)?
                  DonationButton(
                    idProject: 0,
                    onPressedButton: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Confirmer le don',
                  ): const Text(""),
                  shareButton(),
                ],
              ),
            )
        ),
      );
  }

  Widget shareButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {

            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5)), ),
            label: const Text(
              "Partager",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.share, color: Colors.white),
          ),
        )
    );
  }
}



