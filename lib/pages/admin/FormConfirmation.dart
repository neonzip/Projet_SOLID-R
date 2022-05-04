import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormConfirmation extends StatefulWidget {
  const FormConfirmation({Key? key}) : super(key: key);

  @override
  _FormConfirmationState createState() => _FormConfirmationState();
}

class _FormConfirmationState extends State<FormConfirmation> {
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
}