import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/view/Templates/AddingProject/FormTextFieldAdmin.dart';
import '../Templates/AddingProject/FormMultilineTextField.dart';
import '../Templates/AddingProject/CarousselPictures.dart';

class FormMecene extends StatefulWidget {
  const FormMecene({Key? key}) : super(key: key);

  @override
  _FormMeceneState createState() => _FormMeceneState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormMeceneState extends State<FormMecene> with AutomaticKeepAliveClientMixin<FormMecene>{
  bool alreadyExist = true;

  late TextEditingController textEditingControllerDescriptionMecene;
  late TextEditingController textEditingControllerNameMecene;

  String errorMessageNameMecene = "Veuillez entrer le nom du mécène.";

  @override
  void initState() {
    textEditingControllerNameMecene = TextEditingController();
    textEditingControllerNameMecene.addListener(() {
      onChangedName();
    });

    textEditingControllerDescriptionMecene = TextEditingController();
    textEditingControllerDescriptionMecene.addListener(() {
      onChangedDescription();
    });

    super.initState();
  }

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
                    FormTextFieldAdmin(
                      key: widget.key,
                      inputType: TextInputType.text,
                      errorMessage: errorMessageNameMecene,
                      labelHint: "Entrez le nom du mécène",
                      label: "Nom",
                      textEditingController: textEditingControllerNameMecene,
                    ),
                    FormMultilineTextField(
                        key: widget.key,
                        errorMessage: "",
                        labelHint: "Entrez la description du mécène",
                        label: "Description",
                      textEditingController: textEditingControllerDescriptionMecene,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text("Images"),
                          padding: const EdgeInsets.only(right:20.0, left:20.0, top: 20),
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                alreadyExist = false;
                              });
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                            child: const Text(
                              "Ajouter une photo",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          padding: const EdgeInsets.only(right:20.0, left:20.0),
                        ),
                        const CarouselPictures(),
                      ],
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

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerNameMecene.text;

    print("Last name value : " + name);                   // Temporary : prints to the console the value of the email

    // The name is empty
    if (name.isEmpty) {
      errorMessageNameMecene = "Veuillez entrer le nom du mécène.";
    }
    // The name is correct
    else {
      errorMessageNameMecene = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    // TODO : Get the value of the specific controller in order to have the value of the description to add to the DB.
  }

  @override
  bool get wantKeepAlive => true;
}