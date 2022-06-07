import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/FormTextFieldAdmin.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';

import '../Templates/FormMultilineTextField.dart';

class FormProjectUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormProjectUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormProjectUpdateState createState() => _FormProjectUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormProjectUpdateState extends State<FormProjectUpdate> with AutomaticKeepAliveClientMixin<FormProjectUpdate>{

  String errorMessageName = "";
  String errorMessageGoalDonation = "";
  String errorMessageDescription = "";

  late TextEditingController textEditingControllerName;
  late TextEditingController textEditingControllerGoalDonation;
  late TextEditingController textEditingControllerDescription;

  @override
  void initState() {
    textEditingControllerName = TextEditingController();
    textEditingControllerName.text = widget.project.projectName;
    textEditingControllerName.addListener(() {
      onChangedName();
    });

    textEditingControllerDescription = TextEditingController();
    textEditingControllerDescription.text = widget.project.projectDescription;
    textEditingControllerDescription.addListener(() {
      onChangedDescription();
    });

    textEditingControllerGoalDonation = TextEditingController();
    textEditingControllerGoalDonation.text = widget.project.projectDonationGoal.toString();
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

    if (kDebugMode) {
      print("Last name value : " + name);
    }                   // Temporary : prints to the console the value of the email

    // The name is empty
    if (name.isEmpty) {
      errorMessageName = "Veuillez entrer le nom du projet.";
    }
    // The name is correct
    else {
      errorMessageName = "";
    }
    setState(() {
      widget.project.projectName = textEditingControllerName.text;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    // TODO : Get the value of the specific controller in order to have the value of the description to add to the DB.
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String description = textEditingControllerDescription.text;

    if (kDebugMode) {
      print("Last description value : " + description);
    }                   // Temporary : prints to the console the value of the email

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
      widget.project.projectDescription = textEditingControllerDescription.text;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedGoalDonation() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String value = textEditingControllerGoalDonation.text;

    if (kDebugMode) {
      print("Last value : " + value);
    }                   // Temporary : prints to the console the value of the email

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
      widget.project.projectDonationGoal = double.parse(textEditingControllerGoalDonation.text);
      // It updates the widget in order to load the error message changes in this case
    });
  }

  @override
  bool get wantKeepAlive => true;
}