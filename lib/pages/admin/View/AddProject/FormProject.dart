import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormMultilineTextField.dart';
import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormTextFieldAdmin.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class FormProject extends StatefulWidget {
  const FormProject({Key? key}) : super(key: key);

  @override
  _FormProjectState createState() => _FormProjectState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormProjectState extends State<FormProject> with AutomaticKeepAliveClientMixin<FormProject>{

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
                FormTextFieldAdmin(
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

  @override
  bool get wantKeepAlive => true;
}