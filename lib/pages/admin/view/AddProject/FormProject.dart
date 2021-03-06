import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/FormMultilineTextField.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/FormTextFieldAdmin.dart';

import '../../../MODEL/ProjectModel.dart';

class FormProject extends StatefulWidget {
  final PageController controller;

  final ProjectModel project;

  const FormProject({Key? key, required this.controller, required this.project}) : super(key: key);

  @override
  _FormProjectState createState() => _FormProjectState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormProjectState extends State<FormProject> with AutomaticKeepAliveClientMixin<FormProject>{

  String errorMessageName = "Veuillez entrer le nom du projet.";
  String errorMessageGoalDonation = "Veuillez entrer la cagnotte visée du projet.";
  String errorMessageDescription = "Veuillez entrer l'objectif du projet.";

  late TextEditingController textEditingControllerName;
  late TextEditingController textEditingControllerGoalDonation;
  late TextEditingController textEditingControllerDescription;

  @override
  void initState() {
    textEditingControllerName = TextEditingController();
    textEditingControllerName.addListener(() {
      onChangedName();
    });

    textEditingControllerDescription = TextEditingController();
    textEditingControllerDescription.addListener(() {
      onChangedDescription();
    });

    textEditingControllerGoalDonation = TextEditingController();
    textEditingControllerGoalDonation.addListener(() {
      onChangedGoalDonation();
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
                  child: const Text("Projet", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                FormTextFieldAdmin(
                  key: widget.key,
                  inputType: TextInputType.text,
                  errorMessage: errorMessageName,
                    labelHint: "Entrez le nom du projet",
                    label: "Nom",
                  textEditingController: textEditingControllerName,
                ),
                FormMultilineTextField(
                  key: widget.key,
                    errorMessage: errorMessageDescription,
                    labelHint: "Entrez l'objectif du projet",
                    label: "Objectif",
                  textEditingController: textEditingControllerDescription,
                ),
                FormTextFieldAdmin(
                  key: widget.key,
                  inputType: TextInputType.number,
                  errorMessage: errorMessageGoalDonation,
                  labelHint: "Entrez le montant",
                  label: "Cagnotte envisagée",
                  textEditingController: textEditingControllerGoalDonation,
                ),
              ],
            ),
          ),
        )
    );
  }

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerName.text;

    print("Last name value : " + name);                   // Temporary : prints to the console the value of the email

    // The name is empty
    if (name.isEmpty) {
      errorMessageName = "Veuillez entrer le nom du projet.";
    }
    // The name is correct
    else {
      errorMessageName = "";
    }
    setState(() {
      widget.project.projectName = name;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    // TODO : Get the value of the specific controller in order to have the value of the description to add to the DB.
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String description = textEditingControllerDescription.text;

    print("Last description value : " + description);                   // Temporary : prints to the console the value of the email

    // The description is empty
    if (description.isEmpty) {
      errorMessageDescription = "Veuillez entrer l'objectif du projet.";
    }

    // TODO : Make sure that the admin is setting a right format for the donation.
    // The value is correct
    else {
      errorMessageDescription = "";
    }
    setState(() {
      widget.project.projectDescription = description;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedGoalDonation() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String value = textEditingControllerGoalDonation.text;

    print("Last value : " + value);                   // Temporary : prints to the console the value of the email

    // The value is empty
    if (value.isEmpty) {
      errorMessageGoalDonation = "Veuillez entrer la cagnotte visée du projet.";
    }

    // TODO : Make sure that the admin is setting a right format for the donation.
    // The value is correct
    else {
      errorMessageGoalDonation = "";
    }
    setState(() {
      widget.project.projectDonationGoal = double.parse(value);
      // It updates the widget in order to load the error message changes in this case
    });
  }

  @override
  bool get wantKeepAlive => true;
}