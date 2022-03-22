import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/SigninButton.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Connexion"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                children: [
                  textFieldTemplate("Email :", "Entrez votre email"),
                  textFieldTemplate("Mot de passe :", "Entrez votre mot de passe"),
                  SigninButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text("Mot de passe oublié ? "),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pas encore de compte ? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: const Text("S'inscrire"),
                      ),
                    ],
                  )
                ],
              ),
            )
          )
        )
    );
  }
}
