import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  /// Widget which contributes to create a textfield.
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

  /// Widget building the button to submit.
  Widget buttonSubmitTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
        child: const Text(
          "S'inscrire",
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
          title: const Text("Inscription"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              textFieldTemplate("Email :", "Entrez votre email"),
              textFieldTemplate("Pseudo :", "Entrez votre pseudo"),
              textFieldTemplate("Mot de passe :", "Entrez votre mot de passe"),
              const Text(
                  "En vous inscrivant, vous acceptez nos conditions d'utilisation",
                textAlign: TextAlign.center,
              ),
              buttonSubmitTemplate(),
              const Text("Déjà membre ? " "Se connecter"),
            ],
          ),
        )
    );
  }
}
