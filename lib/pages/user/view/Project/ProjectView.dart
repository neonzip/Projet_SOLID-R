import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Project/ProjectDetailedView.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/view/templates/Project/SeeMoreButton.dart';
import '../templates/DonationButton.dart';
import '../templates/Project/ProjectProgressBar.dart';
import '../templates/Project/FavoriteButton.dart';

class ProjectView extends StatefulWidget {
  final ProjectModel project;
  final double contribution;

  const ProjectView({Key? key, required this.project, required this.contribution}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

/// Class of one instance of project.
class _ProjectViewState extends State<ProjectView>{

  /// Widget for one card which is containing the information about a project.
  Widget projectTemplate(){
    double contribute = widget.contribution;
    double progressGoal = widget.project.projectResult;
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                        children: [
                          AutoSizeText(
                            widget.project.projectName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Image.asset(widget.project.getAssociationProject().associationLogo, height: 60, width: 60,),
                          //buttonFavorite(),
                          FavoriteButton(isFav:widget.project.projectIsFavorite),
                        ]
                    ),
                  ],
                )
            ),

            /* Displays the progress bar */
            SizedBox(
                width: 300,
                child: Column(
                  children: [
                    ProjectProgressBar(
                        valueBar: progressGoal / 100, // %
                    ),

                    Container (
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Column(
                          children: [
                            Text("$progressGoal % financés"),
                            Text("Participation : $contribute %")
                          ]
                      ),
                    )
                  ],
                )
            ),

             /* Displays the introduction's project */
             SizedBox(
                child: Text(
                  widget.project.projectDescription,
                  textAlign: TextAlign.justify,
                )
            ),

            /* Line with the two buttons */
            Row(
              children: [
                const Spacer(
                  flex: 10,
                ),

                /* Button "Voir plus" */
                SeeMoreButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ProjectDetailed(project: widget.project,)));
                    },
                    idProject: widget.project.projectID,
                ),
                const Spacer(),
                /* Button "Donner" is displayed if it is not finished, then nothing. */
                (widget.project.projectResult < 100)?
                DonationButton(
                  onPressedButton: showDonationDialog,
                  idProject: widget.project.projectID,
                  text: 'Donner',
                ) :const Text(""),
              ],
            )
          ],
        ),
      ),
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
                DonationButton(
                  idProject: 0,
                  onPressedButton: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Confirmer le don',
                ),
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

  @override
  Widget build(BuildContext context) {
    return projectTemplate();
  }
}