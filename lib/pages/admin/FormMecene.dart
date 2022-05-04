import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormTextField.dart';
import 'View/Templates/AddingProject/FormMultilineTextField.dart';

class FormMecene extends StatefulWidget {
  const FormMecene({Key? key}) : super(key: key);

  @override
  _FormMeceneState createState() => _FormMeceneState();
}

class _FormMeceneState extends State<FormMecene> {
  bool alreadyExist = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        body: SingleChildScrollView(
          child: Center(
              child: Visibility(
                child: (alreadyExist == false) ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Le mécène existe déjà ?"),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alreadyExist = true;
                                });
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                              child: const Text(
                                "Sélectionner un mécène",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                    ),
                    FormTextField(
                      key: widget.key,
                      inputType: TextInputType.text,
                      errorMessage: "Champ vide",
                      labelHint: "Entrez le nom du mécène",
                      label: "Nom",
                    ),
                    FormMultilineTextField(
                        key: widget.key,
                        errorMessage: "Champ vide",
                        labelHint: "Entrez la description du mécène",
                        label: "Description"
                    ),
                  ],
                )
                    :
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Le mécène n'existe pas encore ?"),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alreadyExist = false;
                                });
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                              child: const Text(
                                "Ajouter un mécène",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )

          ),
        )
    );
  }
}