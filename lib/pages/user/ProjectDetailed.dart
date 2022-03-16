import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:projet_solid_r/pages/user/Project.dart';
import 'package:projet_solid_r/pages/user/templates/FavoriteButton.dart';

class ProjectDetailed extends StatefulWidget {
 // Project projectToSee;
  const ProjectDetailed({Key? key,/* required this.projectToSee */}) : super(key: key);

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
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))
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
            const AutoSizeText(
              "Cagnotte remplie en " "XX" " jours",
            textAlign: TextAlign.center,
              maxLines: 2
            ),
        ],
      ),
    );
  }

  /// Widgets which contains the part
  Widget meceneInformationTemplate() {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      padding: const EdgeInsets.all(5),
      child: Table(
        children: [
          TableRow(
            children: [
            Column(
                children: [
                  const AutoSizeText("Proposé par :\n"),
                  Image.asset(
                    "assets/logo_solid_R.png",
                  )
                ],
            ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: const Text("Financé par :"),
                  ),
                  const AutoSizeText(
                    "NomDuMecene",
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  )
                ],
              )
            ]
          )
        ],
      ),
    );
  }

  /// Widget which contains the two containers about the user's participation and the association that proposed the project, ...
  /// This represents the first part before the blue line.
  Widget globalInformationTemplate() {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Table(
          children: [
            TableRow(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: const [
                          AutoSizeText(
                            "Projet au nom Projet au nom Projet au nom Projet au nom ",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ],
                      )
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Objectif atteint le " "11/02/2023",
                      textAlign: TextAlign.end,
                    ),
                  )
                ]
            ),
            TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child: const Text("Association qui propose"),
                  ),
                  const Text(""),
                ]
            ),
            TableRow(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                  child:
                  FavoriteButton(
                    isFav: true,    // Value to change in function of the project we use
                  ),
                ),

                Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
                    label: const Text(
                      "Donner",
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(Icons.volunteer_activism, color: Colors.black),
                  ),
                ),
              ]
            ),

          ]
      ),
    );
  }

  Widget projectDetailedNavigation() {
    return
      DefaultTabController(
        length: 4 ,
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
              tabs: const [
                Tab(text: 'Projet',),
                Tab(text: 'Association',),
                Tab(text: 'Mécène',),
                Tab(text: 'Résultats',)
              ],
            ),
          ),
          body: TabBarView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  const AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. \n\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. ',
                    textAlign: TextAlign.justify,
                  ),

                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  const AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. \n\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. ',
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  const AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. \n\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. ',
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child:
                  const AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. \n\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. ',
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
          children: const [
            Text("Projets soutenus"),
            Text("un projet au nom long",
            style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
            globalInformationTemplate(),
        participationInformationTemplate(),
        meceneInformationTemplate(),
        /* Blue horizontal line separating the two parts of the main page. */
        const Divider(
          color: Colors.blue,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
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
    );
  }
}



