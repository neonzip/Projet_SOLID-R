import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../Templates/FormMultilineTextField.dart';
import '../Templates/CarousselPictures.dart';
import '../Templates/FormTextFieldAdmin.dart';

class FormMeceneUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormMeceneUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormMeceneUpdateState createState() => _FormMeceneUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormMeceneUpdateState extends State<FormMeceneUpdate> with AutomaticKeepAliveClientMixin<FormMeceneUpdate>{
  bool alreadyExist = true;

  late TextEditingController textEditingControllerDescriptionMecene;
  late TextEditingController textEditingControllerNameMecene;

  String errorMessageNameMecene = "";

  @override
  void initState() {
    textEditingControllerNameMecene = TextEditingController();
    textEditingControllerNameMecene.text = widget.project.getEntityProject().entityName;
    textEditingControllerNameMecene.addListener(() {
      onChangedName();
    });

    textEditingControllerDescriptionMecene = TextEditingController();
    textEditingControllerDescriptionMecene.text = widget.project.projectEntity.entityDescription;
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
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
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
          ),
        )
    );
  }

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerNameMecene.text;

    if (kDebugMode) {
      print("Last name value : " + name);
    }                   // Temporary : prints to the console the value of the email

    // The name is empty
    if (name.isEmpty) {
      errorMessageNameMecene = "Veuillez entrer le nom du mécène.";
    }
    // The name is correct
    else {
      errorMessageNameMecene = "";
    }
    setState(() {
      widget.project.projectEntity.entityName = name;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    widget.project.projectEntity.entityDescription = textEditingControllerDescriptionMecene.text;
  }

  @override
  bool get wantKeepAlive => true;
}