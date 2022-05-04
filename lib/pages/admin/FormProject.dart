import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormMultilineTextField.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormTextField.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class FormProject extends StatefulWidget {
  const FormProject({Key? key}) : super(key: key);

  @override
  _FormProjectState createState() => _FormProjectState();
}

class _FormProjectState extends State<FormProject> {

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
                FormTextField(
                  key: widget.key,
                  inputType: TextInputType.text,
                  errorMessage: "Champ vide",
                    labelHint: "Entrez le nom du projet",
                    label: "Nom",
                ),
                FormMultilineTextField(
                  key: widget.key,
                    errorMessage: "Champ vide",
                    labelHint: "Entrez l'objectif du projet",
                    label: "Objectif"
                ),
                FormTextField(
                  key: widget.key,
                  inputType: TextInputType.number,
                  errorMessage: "Champ vide",
                  labelHint: "Entrez le montant",
                  label: "Cagnotte envisagée",
                ),
              ],
            ),
          ),
        )
    );
  }
}