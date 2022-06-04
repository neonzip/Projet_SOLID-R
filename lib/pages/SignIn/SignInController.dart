import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/SignIn/ForgotPasswordController.dart';
import 'package:projet_solid_r/pages/user/dao/UserDAO.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/LaunchHome/PartIn/SigninButton.dart';

import '../HomeView.dart';

/// Widget view which builds the entire widget for the page to sign in.
/// There are several controllers for getting and changing content fields.
class SignInController extends StatefulWidget {
  const SignInController({Key? key}) : super(key: key);

  @override
  _SignInControllerState createState() => _SignInControllerState();
}

/// Widget state which builds the entire widget for the page to sign in.
class _SignInControllerState extends State<SignInController> {

  /// Each text fields has its own controller.
  /// They allow us to change the content of the error message when the user sets the value of the associated text field.
  /// We initialize them later in the initialization of the widget.
  late TextEditingController textEditingControllerForEmail;               // Email controller
  late TextEditingController textEditingControllerForPassword;            // Password controller

  /// Each error message we have to put in the form.
  /// These message will change during the input form when the user sets a value.
  /// They are here to "tell" to the user if its input is alright or not.
  String messageErrorEmail = 'Veuillez saisir votre email.';                                       // Email error message
  String messageErrorPassword = 'Veuillez saisir votre mot de passe.';    // Password error message
  String messageNotExist = "";            // User does not exist : error message

  /// Initializer of this widget controller for the page to sign in.
  @override
  void initState() {

    /// Initialization of the email controller.
    /// We add a listener to the controller in order to catch the event when the user is setting the input.
    /// When the user changes the value of the email, we call the function onChangedEmail().
    textEditingControllerForEmail = TextEditingController();
    textEditingControllerForEmail.addListener(() {
      onChangedEmail();
    });

    /// Initialization of the password controller.
    /// We add a listener to the controller in order to catch the event when the user is setting the input.
    /// When the user changes the value of the password, we call the function onChangedPassword().
    textEditingControllerForPassword = TextEditingController();
    textEditingControllerForPassword.addListener(() {
      onChangedPassword();
    });

    super.initState();
  }

  /// Function called when the user changes the email input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedEmail() {
    messageNotExist = "";

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerForEmail.text;

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

  /// Function called when the user changes the password input.
  /// It verifies if the input is correct.
  /// If it is not correct, the error message is displayed with the right message error.
  void onChangedPassword() {
    messageNotExist = "";

    /// We get the last modified value of the password text field and create a specific variable to use it.
    String password = textEditingControllerForPassword.text;

    print("Last password value : " + password);                   // Temporary : prints to the console the value of the password

    // The password is empty
    if (password.isEmpty) {
      messageErrorPassword = "Veuillez saisir votre mot de passe.";
    }
    // The password is OK
    else {
      messageErrorPassword = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }

  /// Build of the widget, of the page of the connection
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          width: 500,
          child: Column(
            children: [

              /// Here is the text field for the email.
              /// It is there that we add the controller, and all components of the widget that the user sees on the screen for the email
              FormTextField(
                hidden: false,
                errorMessage: messageErrorEmail,
                label: "Email :",
                labelHint: "Entrez votre email",
                text: '',
                textEditingController: textEditingControllerForEmail,
              ),

              /// Here is the text field for the password
              /// It is there that we add the controller, and all components of the widget that the user sees on the screen for the password
              FormTextField(
                hidden: true,
                errorMessage: messageErrorPassword,
                label: "Mot de passe :",
                labelHint: "Entrez votre mot de passe",
                text: '',
                textEditingController: textEditingControllerForPassword,
              ),

              /// This widget displays the button to sign in.
              /// When the user clicks on it, he is automatically redirected on his own account (home user page).
              SigninButton(
                onPressed: () async {
                  //TODO: Check if the user exists and if it is OK send him to his account.
                  String emailUser = textEditingControllerForEmail.text;
                  String password = textEditingControllerForPassword.text;

                  UserModel? user;
                  await UserDAO().getUserFromDatabase(emailUser, password).then((value) {
                    user = value;
                  });

                  if (user?.userID != "") {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HomeView(user: user!)));
                  }
                  else {
                    // TODO : Do something to say that the user does not exist.
                    messageNotExist = "L'utilisateur que vous avez saisi n'existe pas. Veuillez vérifier votre saisie.";
                    setState(() {
                    });
                  }
                },
              ),

              /// In case that the user forgot his password.
              TextButton(
                onPressed: () {
                  showDialogForgottenPassword();
                },
                child: const Text("Mot de passe oublié ? "),
              ),

              /// If the user has done a mistake and went to the wrong page,
              /// he can go to the registration page by clicking the following hyperlink.
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
              Text(
                messageNotExist,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        )
    );
  }

  void showDialogForgottenPassword() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Container(
              alignment: Alignment.center,
              child: const Text(
                "Mot de passe oublié ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            content: const ForgotPasswordController(),
        )
    );
  }
}
