import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
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
        body: FooterView(
          footer: Footer(
            padding: const EdgeInsets.all(0),
            child: Image.asset(
                "assets/footer.png"
            ),
          ),
          children: [
            Center(
                child: SizedBox(
                  width: 500,
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
                          Navigator.pushNamed(context, "/user/home");
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
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
    );
  }
}
