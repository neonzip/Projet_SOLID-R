import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/DonationButton.dart';
import 'package:projet_solid_r/pages/user/templates/FavoriteButton.dart';
import 'package:projet_solid_r/pages/user/templates/ProjectProgressBar.dart';

import '../model/ProjectModel.dart';

/// Class of one instance of project.
class ProjectView extends ProjectModel{
  ProjectView(int id, bool isFavorite, BuildContext contextProject, String name, String text) : super(id, isFavorite, contextProject, name, text);

  /// Widget for one card which is containing the information about a project.
   Widget projectTemplate(){
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
                            projectName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Image.asset(associationProject.associationLogo, height: 60, width: 60,),
                          //buttonFavorite(),
                          FavoriteButton(isFav:isFavoriteProject),
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
                        valueBar: getResultProject() / 100, // %
                    ),

                    Container (
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Column(
                          children: const [
                            Text("50" " % financés"),
                            Text("Participation : " "30" " %")
                          ]
                      ),
                    )
                  ],
                )
            ),

             /* Displays the introduction's project */
             SizedBox(
                child: Text(
                  projectDescription,
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
                buttonSeeMore(),
                const Spacer(),
                /* Button "Donner" */
                DonationButton(
                  onPressedButton: showDonationDialog,
                  idProject: projectID,
                  text: 'Donner',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Button to see more details about a=the specific project.
  /// Called "Voir plus".
  Widget buttonSeeMore() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "/projects/section=formal/name=nomProjet");
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
            label: const Text(
              "Voir plus",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.menu_open, color: Colors.white),
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
}