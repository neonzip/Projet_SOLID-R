import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/view/templates/SigninButton.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
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
                  const FormTextField(
                      errorMessage: "Champ vide.",
                      labelHint: "Email :",
                      label: "Entrez votre email"
                  ),
                  const FormTextField(
                      errorMessage: "Champ vide.",
                      labelHint: "Mot de passe :",
                      label: "Entrez votre mot de passe"
                  ),                  SigninButton(
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
                  ),
                  Image.asset(
                    "assets/footer.png"
                  )
                ],
              ),
            )
          )
        )
    );
  }
}
