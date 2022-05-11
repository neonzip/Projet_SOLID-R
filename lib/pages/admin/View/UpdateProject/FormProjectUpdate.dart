import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormMultilineTextField.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/UpdatingProject/FormMultilineTextFieldWithContent.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/UpdatingProject/FormTextFieldWithContentAdmin.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class FormProjectUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormProjectUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormProjectUpdateState createState() => _FormProjectUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormProjectUpdateState extends State<FormProjectUpdate> with AutomaticKeepAliveClientMixin<FormProjectUpdate>{

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
                FormTextFieldWithContentAdmin(
                  key: widget.key,
                  inputType: TextInputType.text,
                  errorMessage: "Champ vide",
                    labelHint: "Entrez le nom du projet",
                    label: "Nom",
                  text: widget.project.projectName,
                ),
                FormMultilineTextFieldWithContent(
                  key: widget.key,
                    errorMessage: "Champ vide",
                    labelHint: "Entrez l'objectif du projet",
                    label: "Objectif",
                  text: widget.project.projectDescription,
                ),
                FormTextFieldWithContentAdmin(
                  key: widget.key,
                  inputType: TextInputType.number,
                  errorMessage: "Champ vide",
                  labelHint: "Entrez le montant",
                  label: "Cagnotte envisagée",
                  text: widget.project.projectDonationGoal.toString(),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}