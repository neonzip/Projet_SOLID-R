import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/templates/MessageSnackbar.dart';

class MyInformation extends StatefulWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {

  /// Widget which contributes to create a textfield with the data we want.
  Widget textFieldTemplate(String labelData, String? labelDataHint) {
    return
      Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(labelData),
            ),

            TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                suffixIcon: const Icon(Icons.create_outlined, color: Colors.black,), //icon at tail of input
                hintText: labelDataHint,
              ),
            ),
          ],
        )

      );
  }

  /// Action done when the button to validate changes is clicked.
  void buttonSubmitChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(5),
          backgroundColor: Colors.white,
          shape: const Border(
              bottom: BorderSide(color: Colors.yellow),
          ),
          content: MessageSnackbar(
            title: 'Modifications validées\n',
            text: "Les modifications du profil ont bien été prises en compte.",
          ),
          duration: const Duration(seconds: 5),
        )
    );
  }

  /// Widget building the button to validate changes.
  Widget buttonValidationTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        /* Action the button does if it is clicked. */
        onPressed: buttonSubmitChanges,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
        child: const Text(
          "Valider les modifications",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF1FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Mes informations"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                FormTextField(
                    errorMessage: "Champ vide.",
                    labelHint: "aaa@bbb.ccc",
                    label: "Email :"
                ),
                FormTextField(
                    errorMessage: "Champ vide.",
                    labelHint: "pseudo",
                    label: "Pseudo :"
                ),
                FormTextField(
                    errorMessage: "Champ vide.",
                    labelHint: "mdp",
                    label: "Mot de passe :"
                ),
                buttonValidationTemplate(),
              ],
            ),
          )
        )
      )
    );
  }
}
