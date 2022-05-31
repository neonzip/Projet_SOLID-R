import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/EntityModel.dart';

import '../../../user/model/AssociationModel.dart';
import '../../../user/model/ProjectModel.dart';

class FormConfirmation extends StatefulWidget {
  final PageController controller;

  final ProjectModel project;

  final AssociationModel association;

  final EntityModel entity;

  const FormConfirmation({Key? key, required this.controller, required this.project, required this.association, required this.entity}) : super(key: key);

  @override
  _FormConfirmationState createState() => _FormConfirmationState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormConfirmationState extends State<FormConfirmation> with AutomaticKeepAliveClientMixin<FormConfirmation> {
  bool isYesForAdding = true;
  bool isNoForAdding = false;

  bool isYesForPublication = true;
  bool isNoForPublication = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Confirmation de création", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Êtes-vous sûr de vouloir ajouter ce projet aux autres ?",),
                      Row (
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isNoForAdding = false;
                                  isYesForAdding = true;
                                });

                              },
                              style: //ButtonStyle
                              ElevatedButton.styleFrom(
                                primary: isYesForAdding ? const Color(0xFF0725A5) : Colors.white,
                                side: BorderSide(
                                    width: 0.5,
                                    color: isYesForAdding ? const Color(0xFF0725A5) : Colors.black
                                ),
                                padding: const EdgeInsets.all(10),
                              ),
                              child: Text(
                                "Oui",
                                style: TextStyle(
                                    color: isYesForAdding? Colors.white : Colors.black
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child:
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isYesForAdding = false;
                                  isNoForAdding = true;
                                });

                              },
                              style: //ButtonStyle
                              ElevatedButton.styleFrom(
                                primary: isNoForAdding ? const Color(0xFF0725A5) : Colors.white,
                                side: BorderSide(
                                  width: 0.5,
                                  color: isNoForAdding ? const Color(0xFF0725A5) : Colors.black,
                                ),
                                padding: const EdgeInsets.all(10),
                              ),
                              child: Text(
                                "Non",
                                style: TextStyle(
                                  color: isNoForAdding? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),

                Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Publier le projet ?",),
                        Row (
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isNoForPublication = false;
                                    isYesForPublication = true;
                                  });
                                },
                                style: //ButtonStyle
                                ElevatedButton.styleFrom(
                                  primary: isYesForPublication ? const Color(0xFF0725A5) : Colors.white,
                                  side: BorderSide(
                                      width: 0.5,
                                      color: isYesForPublication ? const Color(0xFF0725A5) : Colors.black
                                  ),
                                  padding: const EdgeInsets.all(10),
                                ),
                                child: Text(
                                  "Oui",
                                  style: TextStyle(
                                      color: isYesForPublication? Colors.white : Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child:
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isYesForPublication = false;
                                    isNoForPublication = true;
                                  });

                                },
                                style: //ButtonStyle
                                ElevatedButton.styleFrom(
                                  primary: isNoForPublication ? const Color(0xFF0725A5) : Colors.white,
                                  side: BorderSide(
                                    width: 0.5,
                                    color: isNoForPublication ? const Color(0xFF0725A5) : Colors.black,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                ),
                                child: Text(
                                  "Non",
                                  style: TextStyle(
                                    color: isNoForPublication? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO: Add all the objects below in the database.
                      print("OUI CA PASSE :\nProjet = " + widget.project.projectDonationGoal.toString() + "\t" + widget.project.projectDescription + '\t' + widget.project.projectName);
                      print("Association = " + widget.association.associationMail + "\t" + widget.association.entityDescription + "\t" + widget.association.entityName);
                      print("Mécène = " + widget.entity.entityDescription + "\t" + widget.entity.entityName);
                      showConfirmation();
                    },
                    style: //ButtonStyle
                    ElevatedButton.styleFrom(
                      primary: const Color(0xFF0725A5),
                      side: const BorderSide(
                          width: 0.5,
                          color: Color(0xFF0725A5)
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(
                      "TERMINER",
                      style: TextStyle(
                          color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;

  void showConfirmation() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Container(
              alignment: Alignment.center,
              child: const Text(
                "Votre projet a été ajouté !",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            content: SingleChildScrollView(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Votre projet a bien été créé.",
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Retour à l'accueil",
                            style: TextStyle(
                              color: Color(0xFF0725A5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:const Color(0xFF0725A5),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          onPressed: () {
                            // TODO : Renvoyer aux détails du projet créé.
                          },
                          child: const Text(
                            "Voir le projet",
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))
    );
  }
}