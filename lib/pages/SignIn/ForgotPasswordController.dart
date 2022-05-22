import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';

/// These are the parameters of the account of the association.
/// Thanks to it, we can send messages to the users if they have forgotten their password.
String EMAIL = "sport.solidr.test@gmail.com";
String PASS = "abmmtijm";

/// Widget view which builds the entire widget for the dialog of forgotten password.
class ForgotPasswordController extends StatefulWidget {
  const ForgotPasswordController({Key? key}) : super(key: key);

  @override
  _ForgotPasswordControllerState createState() => _ForgotPasswordControllerState();
}

/// Widget state which build the entire widget for the dialog.
class _ForgotPasswordControllerState extends State<ForgotPasswordController> {
  /// Text field which has its own controller.
  /// It allows us to change the content of the error message when the user sets the value of the associated text field.
  /// We initialize it later in the initialization of the widget.
  late TextEditingController textEditingControllerMailForPassword;

  /// Error message we have to put in the form.
  /// This message will change during the input form when the user sets a value.
  /// They are here to "tell" to the user if its input is alright or not.
  String messageErrorEmail = "Veuillez saisir votre mail.";


  /// Initializer of this widget controller for the page to change the password.
  @override
  void initState() {
    textEditingControllerMailForPassword = TextEditingController();
    textEditingControllerMailForPassword.addListener(() {
      onChangedForgottenPasswordEmail();
    });

    super.initState();
  }

  /// Build of the widget, of the dialog
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Text(
                  "Saisissez votre adresse mail pour le réinitialiser."
                      "\nUn nouveau mot de passe vous sera adressé par mail."
              )
          ),
          FormTextField(
            hidden: false,
            errorMessage: messageErrorEmail,
            labelHint: "Entrez votre email",
            label: "Email",
            text: '',
            textEditingController: textEditingControllerMailForPassword,
          ),
          ElevatedButton(
            onPressed: () {
              sendMail();
              Navigator.pop(context);
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
            child: const Text(
              "Réinitialiser le mot de passe",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  /// This function sends a message from the association to the user who forgot his password.
  /// It generates a random password with 8 characters and changes the user's password.
  void sendMail() async {
    String username = EMAIL;
    String password = PASS;

    /// Generates a new password
    String newPasswordUser = getRandom(8);

    // TODO: Implement a function to get the user with the specific email address and set his password with the new password that we have generated.

    final smtpServer = gmail(username, password);

    /// Creates the generic message to send to the user
    final message = Message()
      ..from = Address(username)
      ..recipients.add(textEditingControllerMailForPassword.text.toString())
      ..subject = "Réinitialisation de votre mot de passe"
      ..html =
          "<h3>Vous avez oublié votre mot de passe ?</h3>"
          "<p>Votre mot de passe a été réinitialisé. Nous vous avons attribué un nouveau mot de passe. "
          "<br/>Vous pouvez désormais accéder à votre compte en l'utilisant. "
          "<br/>N'oubliez pas d'aller changer votre mot de passe dans votre profil."
          "<br/><br/>Mot de passe : $newPasswordUser";
    try {
      /// Sends the message to the user
      await send(message, smtpServer);
    } on MailerException catch (exception) {
      if (kDebugMode) {
        print("Message not sent :( \n" + exception.toString());
      }
    }
  }

  /// Function called when the user changes the email input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedForgottenPasswordEmail() {

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerMailForPassword.text;

    print("Last email value : " + email);                   // Temporary : prints to the console the value of the email

    // The email is empty
    if (email.isEmpty) {
      messageErrorEmail = "Veuillez saisir votre mail.";
    }
    // The email is correct
    else {
      messageErrorEmail = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }

  /// Method which generates a random password
  String getRandom(int length){
    const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    Random r = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
  }
}
