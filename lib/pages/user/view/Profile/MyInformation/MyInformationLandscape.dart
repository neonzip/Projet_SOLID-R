import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/DAO/UserDAO.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';
import '../../templates/FormTextField.dart';
import '../../templates/MessageSnackbar.dart';

class MyInformationLandscape extends StatefulWidget {
  final UserModel user;
  const MyInformationLandscape({Key? key, required this.user}) : super(key: key);

  @override
  _MyInformationLandscapeState createState() => _MyInformationLandscapeState();
}

class _MyInformationLandscapeState extends State<MyInformationLandscape> {
  /// Each text fields has its own controller.
  /// They allow us to change the content of the error message when the user sets the value of the associated text field.
  /// We initialize them later in the initialization of the widget.
  /// Thanks to them, we can also get the information of the user and display it on the text fields.
  late TextEditingController textEditingControllerForEmail;
  late TextEditingController textEditingControllerForPseudo;
  late TextEditingController textEditingControllerForPassword;

  /// Each error message we have to put in the form.
  /// These message will change during the input form when the user sets a value.
  /// They are here to "tell" to the user if its input is alright or not.
  String messageErrorEmail = 'Veuillez saisir votre email.';                                       // Email error message
  String messageErrorPseudo = 'Veuillez saisir votre pseudo.';                                       // Email error message
  String messageErrorPassword = 'Veuillez saisir votre mot de passe.';                                       // Email error message


  /// Action done when the button to validate changes is clicked.
  void buttonSubmitChanges() {
    widget.user.password = textEditingControllerForPassword.text;
    widget.user.userEmail = textEditingControllerForEmail.text;
    widget.user.userNickName = textEditingControllerForPseudo.text;

    UserDAO().updateUser(widget.user);


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
            title: 'Modifications valid??es\n',
            text: "Les modifications du profil ont bien ??t?? prises en compte.",
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
      onChangedEmail();
    });
    textEditingControllerForEmail.text = widget.user.userEmail;

    textEditingControllerForPseudo = TextEditingController();
    textEditingControllerForPseudo.addListener(() {
      onChangedPseudo();
    });
    textEditingControllerForPseudo.text = widget.user.userNickName;

    textEditingControllerForPassword = TextEditingController();
    textEditingControllerForPassword.addListener(() {
      onChangedPassword();
    });
    textEditingControllerForPassword.text = widget.user.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
                width: 500,
                child: Column(
                  children: [
                    FormTextField(
                      hidden: false,
                      errorMessage: messageErrorEmail,
                      labelHint: "aaa@bbb.ccc",
                      label: "Email :",
                      text: '',
                      textEditingController: textEditingControllerForEmail,
                    ),
                    FormTextField(
                      hidden: false,
                      errorMessage: messageErrorPseudo,
                      labelHint: "Entrez un pseudo",
                      label: "Pseudo :",
                      text: '',
                      textEditingController: textEditingControllerForPseudo,
                    ),
                    FormTextField(
                      hidden: true,
                      errorMessage: messageErrorPassword,
                      labelHint: "Entrez un mot de passe",
                      label: "Mot de passe :",
                      text: '',
                      textEditingController: textEditingControllerForPassword,
                    ),
                    buttonValidationTemplate(),
                  ],
                ),
              )
          )
        )
    );
  }

  /// Function called when the user changes the email input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedEmail() {
    // TODO: Implement the rest of this method in order to change the error message when the user does not put a right email.
    // TODO: Change the message when the email is already taken.

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerForEmail.text;

    if (kDebugMode) {
      print("Last email value : " + email);
    }                   // Temporary : prints to the console the value of the email

    // The email is empty
    if (email.isEmpty) {
      messageErrorEmail = "Veuillez saisir un mail.";
    }
    // The email is correct
    else {
      messageErrorEmail = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }

  /// Function called when the user changes the pseudo input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedPseudo() {
    // TODO: Implement the rest of this method.

    /// We get the last modified value of the pseudo text field and create a specific variable to use it.
    String pseudo = textEditingControllerForPseudo.text;

    if (kDebugMode) {
      print("Last pseudo value : " + pseudo);
    }                   // Temporary : prints to the console the value of the pseudo

    // The pseudo is empty
    if (pseudo.isEmpty) {
      messageErrorPseudo = "Veuillez saisir un pseudo.";
    }
    // The pseudo is correct
    else {
      messageErrorPseudo = "";
    }

    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }

  /// Function called when the user changes the password input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedPassword() {
    //TODO: Implement the rest of this method with a better "security" for the password.

    /// We get the last modified value of the password text field and create a specific variable to use it.
    String password = textEditingControllerForPassword.text;

    if (kDebugMode) {
      print("Last password value : " + password);
    }                   // Temporary : prints to the console the value of the password

    // The password is empty or it does not contain more than 6 characters
    if (password.isEmpty || password.length < 6) {
      messageErrorPassword = "Veuillez saisir un mot de passe d'au moins 6 caract??res.";
    }
    // The password is OK
    else {
      messageErrorPassword = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }
}
