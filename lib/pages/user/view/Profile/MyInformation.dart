import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import '../templates/FormTextField.dart';
import '../templates/MessageSnackbar.dart';

class MyInformation extends StatefulWidget {
  final UserModel user;
  const MyInformation({Key? key, required this.user}) : super(key: key);

  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  late TextEditingController textEditingControllerForEmail;
  late TextEditingController textEditingControllerForPseudo;
  late TextEditingController textEditingControllerForPassword;

  /// Action done when the button to validate changes is clicked.
  void buttonSubmitChanges() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(5),
          backgroundColor: Colors.white,
          shape: Border(
              bottom: BorderSide(color: Colors.yellow),
          ),
          content: MessageSnackbar(
            title: 'Modifications validées\n',
            text: "Les modifications du profil ont bien été prises en compte.",
          ),
          duration: Duration(seconds: 5),
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
  void initState() {
    textEditingControllerForEmail = TextEditingController();
    textEditingControllerForEmail.addListener(() {
      //onChanged();
      //TODO:
    });
    textEditingControllerForPseudo = TextEditingController();
    textEditingControllerForPseudo.addListener(() {
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
      backgroundColor: (MediaQuery.of(context).orientation == Orientation.portrait) ? const Color(0xFFEBF1FF) : Colors.white,
      appBar: (MediaQuery.of(context).orientation == Orientation.portrait) ? AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Mes informations"),
        centerTitle: true,
      ) : null,
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
                        labelHint: "aaa@bbb.ccc",
                        label: "Email :",
                        text: widget.user.userEmail,
                      textEditingController: textEditingControllerForEmail,
                    ),
                    FormTextField(
                        errorMessage: "Champ vide.",
                        labelHint: "pseudo",
                        label: "Pseudo :",
                        text: widget.user.userNickName,
                      textEditingController: textEditingControllerForPseudo,
                    ),
                    FormTextField(
                        errorMessage: "Champ vide.",
                        labelHint: "mdp",
                        label: "Mot de passe :",
                        text: widget.user.password,
                      textEditingController: textEditingControllerForPassword,
                    ),
                    buttonValidationTemplate(),
                  ],
                ),
              )
          )
        ],
      )
    );
  }
}
