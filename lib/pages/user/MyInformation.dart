import 'package:flutter/material.dart';

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

  /// Action done when the button to validate changges is clicked.
  void buttonSubmitChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Container(
            margin: const EdgeInsets.all(10),
            child: Column (
              mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Modifications validées\n",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                ),
              ),
              Text(
                "Les modifications du profil ont bien été prises en compte.",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
                textFieldTemplate("Email :", "aaa@bbb.ccc"),
                textFieldTemplate("Pseudo :", "pseudo"),
                textFieldTemplate("Mot de passe :", "mdp"),
                buttonValidationTemplate(),
              ],
            ),
          )
        )
      )
    );
  }
}
