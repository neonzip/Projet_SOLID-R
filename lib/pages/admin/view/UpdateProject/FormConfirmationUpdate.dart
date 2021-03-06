import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/DAO/ProjectDAO.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';

import '../../../DAO/AssociationDAO.dart';
import '../../../DAO/EntityDAO.dart';
import '../Projects/ProjectDetailedAdmin.dart';

class FormConfirmationUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormConfirmationUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormConfirmationUpdateState createState() => _FormConfirmationUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormConfirmationUpdateState extends State<FormConfirmationUpdate> with AutomaticKeepAliveClientMixin<FormConfirmationUpdate> {
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
                  child: const Text("Confirmation de modification", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Êtes-vous sûr de vouloir modifier ce projet ?",),
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
                  padding: const EdgeInsets.only(top: 50),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      ProjectDAO().updateProject(widget.project);
                      AssociationDAO().updateAssociation(widget.project.projectAssociation);
                      EntityDAO().updateEntity(widget.project.projectEntity);
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
                "Votre projet a été modifié !",
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
                    "Votre projet a bien été modifié.",
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
                            // TODO : Renvoyer aux détails du projet.
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ProjectDetailedAdmin(project: widget.project,)));
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