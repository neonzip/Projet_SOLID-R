import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/DonationButton.dart';
import 'package:projet_solid_r/pages/user/templates/FavoriteButton.dart';

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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          minHeight: 15,
                          color: Color(0xFF0725A5),
                          backgroundColor: Colors.white,
                          value: 0.1, // % so between 0 and 1
                        ),
                      ),
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
                //buttonDonate(),
                const DonationButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  /*Widget buttonDonate() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), ),
            label: const Text(
              "Donner",
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(Icons.volunteer_activism, color: Colors.black),
          ),
        )
    );
  }*/

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

  /*
  * Favorite button.
  * Must work, but not in the table...
  */
  Widget buttonFavorite() {
    return IconButton(
        icon: Icon(isFavoriteProject ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          // Setting the state
          setStateFavorite();
        });
  }
  ///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter

  /* Change the state of the favorite button. */
  setStateFavorite() {
    isFavoriteProject = !isFavoriteProject;
    log("isFav ? ", error: isFavoriteProject);
  }
}