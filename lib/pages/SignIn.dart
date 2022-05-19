import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataUserTest.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/view/templates/SigninButton.dart';

import 'Home.dart';


//TODO: Change the line to access the admin/user view
DataUserTest dataUser = DataUserTest();
UserModel user = dataUser.userdataList.elementAt(0); // To have a fake admin user
//UserModel user = dataUser.userdataList.elementAt(1); // To have a fake X user

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController textEditingControllerForEmail;
  late TextEditingController textEditingControllerForPassword;

  @override
  void initState() {
    textEditingControllerForEmail = TextEditingController();
    textEditingControllerForEmail.addListener(() {
      //onChanged();
      //TODO:
    });
    textEditingControllerForPassword = TextEditingController();
    textEditingControllerForPassword.addListener(() {
      //onChanged();
      //TODO:
    });
    super.initState();
  }

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
                      FormTextField(
                          errorMessage: "Champ vide.",
                          label: "Email :",
                          labelHint: "Entrez votre email",
                          text: '',
                        textEditingController: textEditingControllerForEmail,
                      ),
                      FormTextField(
                          errorMessage: "Champ vide.",
                          label: "Mot de passe :",
                          labelHint: "Entrez votre mot de passe",
                          text: '',
                        textEditingController: textEditingControllerForPassword,
                      ),
                      SigninButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, "/home");
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Home(user: user)));
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
