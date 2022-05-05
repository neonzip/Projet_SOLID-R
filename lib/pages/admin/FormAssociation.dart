import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormTextField.dart';
import 'View/Templates/AddingProject/FormMultilineTextField.dart';
import 'View/Templates/CarousselPictures.dart';

class FormAssociation extends StatefulWidget {
  const FormAssociation({Key? key}) : super(key: key);

  @override
  _FormAssociationState createState() => _FormAssociationState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormAssociationState extends State<FormAssociation> with AutomaticKeepAliveClientMixin<FormAssociation> {
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
                      child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("L\'association existe déjà ?"),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alreadyExist = true;
                                });
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                              child: const Text(
                                "Sélectionner une association",
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
                      labelHint: "Entrez le nom de l'association",
                      label: "Nom",
                    ),
                    FormMultilineTextField(
                        key: widget.key,
                        errorMessage: "Champ vide",
                        labelHint: "Entrez la description de l'association",
                        label: "Description"
                    ),
                    FormTextField(
                      key: widget.key,
                      inputType: TextInputType.text,
                      errorMessage: "Champ vide",
                      labelHint: "Entrez le courriel de l'association",
                      label: "Courriel",
                    ),
                    const CarouselPictures(),
                  ],
                )
                    :
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("L\'association n'existe pas encore ?"),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alreadyExist = false;
                                });
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                              child: const Text(
                                "Ajouter une association",
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

  @override
  bool get wantKeepAlive => true;
}