import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/templates/SignupButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Inscription"),
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
                      labelHint: "Email :",
                      label: "Entrez votre email"
                  ),
                  FormTextField(
                      errorMessage: "Champ vide.",
                      labelHint: "Pseudo :",
                      label: "Entrez votre pseudo"
                  ),
                  FormTextField(
                      errorMessage: "Champ vide.",
                      labelHint: "Mot de passe :",
                      label: "Entrez votre mot de passe"
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: const Text(
                      "En vous inscrivant, vous acceptez nos conditions d'utilisation",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SignupButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    }, text: 'S\'inscrire',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Déjà membre ? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signin");
                        },
                        child: const Text("Se connecter"),
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
