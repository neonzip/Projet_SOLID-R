import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/View/Templates/AddingProject/FormTextField.dart';
import 'View/Templates/AddingProject/FormMultilineTextField.dart';

class FormAddingAssociation extends StatefulWidget {
  const FormAddingAssociation({Key? key}) : super(key: key);

  @override
  _FormAddingAssociationState createState() => _FormAddingAssociationState();
}

class _FormAddingAssociationState extends State<FormAddingAssociation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                ),
                const FormTextField(
                  inputType: TextInputType.text,
                  errorMessage: "Champ vide",
                  labelHint: "Entrez le nom de l'association",
                  label: "Nom",
                ),
                const FormMultilineTextField(
                    errorMessage: "Champ vide",
                    labelHint: "Entrez la description de l'association",
                    label: "Description"
                ),
              ],
            ),
          ),
        )
    );
  }
}