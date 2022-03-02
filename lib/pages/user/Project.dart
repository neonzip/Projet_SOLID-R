import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Class of one instance of project.
class Project {
  /// //////////////////////////////////////////////////////////////////////////
  /// Some attributes we need to create one project.
  /// Below, a constructor.
  /// //////////////////////////////////////////////////////////////////////////
  late bool isFavoriteProject;    // True if it is a favorite project, false then
  late BuildContext context;      // Context we need to redirect to the detailled page of the project
  late String nameProject;        // Project's name
  late String logoProject;        // Project's logo
  late String textProject;        // Project's text introduction
  late int idProject;             // Project's ID

  /// Constructor
  Project (int id, bool isFavorite, BuildContext contextProject, String name, String logo, String text) {
    idProject = id;
    isFavoriteProject = isFavorite;
    context = contextProject;
    nameProject = name;
    logoProject = logo;
    textProject = text;
  }

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
                            nameProject,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Image.asset(logoProject, height: 60, width: 60,),
                          buttonFavorite(),
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
                  textProject,
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
                buttonDonate(),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget buttonDonate() {
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
  }

  /// //////////////////////////////////////////////////////////////////////////
  /// Getters and setters
  /// //////////////////////////////////////////////////////////////////////////

  /// ///////////////////////////
  bool getFavoriteState() {
    return isFavoriteProject;
  }
  setFavoriteState(bool state) {
    isFavoriteProject = state;
  }

  /// ///////////////////////////
  String getNameProject() {
    return nameProject;
  }
  setNameProject(String name) {
    nameProject = name;
  }

  /// ///////////////////////////
  String getLogoProject() {
    return logoProject;
  }
  setLogoProject(String logo) {
    logoProject = logo;
  }

  /// ///////////////////////////
  String getTextProject() {
    return textProject;
  }
  setTextProject(String text) {
    textProject = text;
  }
}