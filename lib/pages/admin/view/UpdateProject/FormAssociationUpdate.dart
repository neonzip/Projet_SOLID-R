import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/FormTextFieldAdmin.dart';

import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import '../Templates/CarousselPictures.dart';
import '../Templates/FormMultilineTextField.dart';

class FormAssociationUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormAssociationUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormAssociationUpdateState createState() => _FormAssociationUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormAssociationUpdateState extends State<FormAssociationUpdate> with AutomaticKeepAliveClientMixin<FormAssociationUpdate> {
  bool alreadyExist = true;

  String errorMessageNameAssociation = "";
  String errorMessageMailAssociation = "";

  late TextEditingController textEditingControllerNameAssociation;
  late TextEditingController textEditingControllerMailAssociation;
  late TextEditingController textEditingControllerDescriptionAssociation;

@override
  void initState() {
    textEditingControllerNameAssociation = TextEditingController();
    textEditingControllerNameAssociation.text = widget.project.getProjectAssociation().entityName;
    textEditingControllerNameAssociation.addListener(() {
      onChangedName();
    });

    textEditingControllerDescriptionAssociation = TextEditingController();
    textEditingControllerDescriptionAssociation.text = widget.project.projectAssociation.entityDescription;
    textEditingControllerDescriptionAssociation.addListener(() {
      onChangedDescription();
    });

    textEditingControllerMailAssociation = TextEditingController();
    textEditingControllerMailAssociation.text = widget.project.projectAssociation.associationMail;
    textEditingControllerMailAssociation.addListener(() {
      onChangedMail();
    });

    super.initState();
  }

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
                    child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                  FormTextFieldAdmin(
                    key: widget.key,
                    inputType: TextInputType.text,
                    errorMessage: errorMessageNameAssociation,
                    labelHint: "Entrez le nom de l'association",
                    label: "Nom",
                    textEditingController: textEditingControllerNameAssociation,
                  ),
                  FormMultilineTextField(
                      key: widget.key,
                      errorMessage: "",
                      labelHint: "Entrez la description de l'association",
                      label: "Description",
                    textEditingController: textEditingControllerDescriptionAssociation,
                  ),
                  FormTextFieldAdmin(
                    key: widget.key,
                    inputType: TextInputType.text,
                    errorMessage: errorMessageMailAssociation,
                    labelHint: "Entrez le courriel de l'association",
                    label: "Courriel",
                    textEditingController: textEditingControllerMailAssociation,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text("Logo"),
                        padding: const EdgeInsets.only(right:20.0, left:20.0, top: 20),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              alreadyExist = false;
                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                          child: const Text(
                            "Modifier le logo",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: const EdgeInsets.only(right:20.0, left:20.0),
                      ),
                      Padding(
                        child: Image.asset(widget.project.projectAssociation.associationLogo),
                        padding: const EdgeInsets.only(left:20, right:20, bottom: 20),
                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }

  void onChangedMail() {
    // TODO: Implement the rest of this method in order to change the error message when the admin does not put a right email.
    // TODO: Change the message when the email does not exist.

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerMailAssociation.text;

    if (kDebugMode) {
      print("Last email value : " + email);
    }                   // Temporary : prints to the console the value of the email

    // The email is empty
    if (email.isEmpty) {
      errorMessageMailAssociation = "Veuillez entrer le courriel de l'association.";
    }
    // The email is correct
    else {
      errorMessageMailAssociation = "";
    }
    setState(() {
      widget.project.projectAssociation.associationMail = email;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerNameAssociation.text;

    if (kDebugMode) {
      print("Last name value : " + name);
    }                   // Temporary : prints to the console the value of the email

    // The name is empty
    if (name.isEmpty) {
      errorMessageNameAssociation = "Veuillez entrer le nom de l'association.";
    }
    // The name is correct
    else {
      errorMessageNameAssociation = "";
    }
    setState(() {
      widget.project.projectAssociation.entityName = name;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
  widget.project.projectAssociation.entityDescription = textEditingControllerDescriptionAssociation.text;
  }

  @override
  bool get wantKeepAlive => true;
}