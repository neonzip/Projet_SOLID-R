import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';
import 'package:url_launcher/url_launcher.dart';

class APropos extends StatefulWidget {
  const APropos({Key? key}) : super(key: key);

  @override
  _AProposState createState() => _AProposState();
}

class _AProposState extends State<APropos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: const Text("A propos"),
            ),
          ),

        //////////////////////////////////////////////////////
        //////////////////////////////////////////////////////

        body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                    "assets/association.png"
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          child: const Text("Missions de l’association",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                    color: Colors.black,
                                  ),
                                ],
                                color: Color(0xFF0725A5),
                                fontSize: 20.0,
                              )
                          )
                      ),

                      /* Text "REUNIR". */
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: const [
                              Text("RÉUNIR\n",
                                  style: TextStyle(
                                    color: Color(0xFF0725A5),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                  "Récréer du lien social par le sport avec les écoliers, les sportifs,  les étudiants, les entreprises dans une démarche RSE et des associations autour de beaux projets Sportifs Solidaires. ",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Color(0xFF0725A5)),
                              )
                            ],
                        )
                      ),
                      const Separator(),
                      /* Text "ORGANISER". */
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: const [
                              Text("ORGANISER\n",
                                  style: TextStyle(
                                    color: Color(0xFF0725A5),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                "Organiser une rencontre avec des bénévoles de l’association que vous souhaitez soutenir pour une présentation de leurs actions et de leurs projets. – Organiser des ateliers de sensibilisation au Handicap avec des athlètes de Haut Niveau qui partageront leurs rêves, leur parcours et leur passion. ",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Color(0xFF0725A5)),
                              )
                            ],
                        )
                      ),
                      const Separator(),
                      /* Text "ACCOMPAGNER". */
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: const [
                              Text("ACCOMPAGNER\n",
                                  style: TextStyle(
                                    color: Color(0xFF0725A5),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                "Accompagner des écoles, des sportifs, des associations et des entreprises dans l’élaboration et la réalisation de leur projet Collectif et Solidaire ",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Color(0xFF0725A5)),
                              )
                            ],
                        )
                      ),
                      const Separator(),
                      /* Text "COMMUNIQUER". */
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: const [
                              Text("COMMUNIQUER\n",
                                  style: TextStyle(
                                    color: Color(0xFF0725A5),
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              Text(
                                "Votre engagement va se voir !\n\nApporter plus de visibilité au Sport Féminin, au Handisport et aux Sports peu médiatisés avec la réalisation de séries de reportages qui donneront la parole aux sportifs et aux associations. Mise en avant de vos engagements sur notre plateforme Sportive Solidaire et nos réseaux sociaux. ",
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Color(0xFF0725A5)),
                              )
                            ],
                        )
                      ),
                      const Separator(),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xFF0725A5),
                  padding: const EdgeInsets.all(30),
                  child:
                  Column(
                    children: [
                      const Text(
                          "TOUS ENSEMBLE, TOUS SOLIDAIRE\nSPORT SOLID’R\n\nFaisons équipe dans ce projet pour soutenir ensemble de belles causes !\n",
                        style: TextStyle(color: Colors.yellow),
                        textAlign: TextAlign.center,
                      ),
                      Linkable(
                          text: "assotstd92@gmail.com\n",
                        textColor: Colors.yellow,
                        linkColor: Colors.yellow,
                      ),
                      Linkable(
                          text: "Tél : 0676864797\n",
                          textColor: Colors.yellow,
                          linkColor: Colors.yellow,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "assotstd.com\n\n\n",
                          style: const TextStyle(color: Colors.yellow),
                          recognizer: TapGestureRecognizer()..onTap = () async {
                            var url = "https://assotstd.com/";
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                            else {
                              throw("cannot launch URL");
                            }
                          }
                        )
                      ),
                      const Text(
                        "sportsoldr©2021 All rights reserved\n\nProgrammes soutenus par Women Innovated & Commit et le Village des Experts",
                        style: TextStyle(color: Colors.yellow),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}
