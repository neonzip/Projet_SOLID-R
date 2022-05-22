import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/view/templates/MessageSnackbar.dart';
import 'package:projet_solid_r/pages/user/view/templates/SignupButton.dart';

/// Widget view which builds the entire widget for the page to sign up.
/// There are several controllers for getting and changing content fields.
class SignUpController extends StatefulWidget {
  const SignUpController({Key? key}) : super(key: key);

  @override
  _SignUpControllerState createState() => _SignUpControllerState();
}

/// Widget state which builds the entire widget for the page to sign up.
class _SignUpControllerState extends State<SignUpController> {

  /// Each text fields has its own controller.
  /// They allow us to change the content of the error message when the user sets the value of the associated text field.
  /// We initialize them later in the initialization of the widget.
  late TextEditingController textEditingControllerForEmail;               // Email controller
  late TextEditingController textEditingControllerForPseudo;              // Pseudo controller
  late TextEditingController textEditingControllerForPassword;            // Password controller

  /// Each error message we have to put in the form.
  /// These message will change during the input form when the user sets a value.
  /// They are here to "tell" to the user if its input is alright or not.
  String messageErrorEmail = 'Veuillez saisir un email.';                                       // Email error message
  String messageErrorPseudo = 'Veuillez saisir un pseudo.';                                     // Pseudo error message
  String messageErrorPassword = 'Veuillez saisir un mot de passe d\'au moins 6 caractères.';    // Password error message


  /// Initializer of this widget controller for the page to sign up.
  @override
  void initState() {

    /// Initialization of the email controller.
    /// We add a listener to the controller in order to catch the event when the user is setting the input.
    /// When the user changes the value of the email, we call the function onChangedEmail().
    textEditingControllerForEmail = TextEditingController();
    textEditingControllerForEmail.addListener(() {
      onChangedEmail();
    });

    /// Initialization of the pseudo controller.
    /// We add a listener to the controller in order to catch the event when the user is setting the input.
    /// When the user changes the value of the pseudo, we call the function onChangedPseudo().
    textEditingControllerForPseudo = TextEditingController();
    textEditingControllerForPseudo.addListener(() {
      onChangedPseudo();
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
    // TODO: Implement the rest of this method in order to change the error message when the user does not put a right email.
    // TODO: Change the message when the email is already taken.

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerForEmail.text;

    print("Last email value : " + email);                   // Temporary : prints to the console the value of the email

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

    print("Last pseudo value : " + pseudo);                   // Temporary : prints to the console the value of the pseudo

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

    print("Last password value : " + password);                   // Temporary : prints to the console the value of the password

    // The password is empty or it does not contain more than 6 characters
    if (password.isEmpty || password.length < 6) {
      messageErrorPassword = "Veuillez saisir un mot de passe d'au moins 6 caractères.";
    }
    // The password is OK
    else {
      messageErrorPassword = "";
    }
    setState(() {
      // It updates the widget in order to load the error message changes in this case
    });
  }


  /// Build of the widget, of the page of the registration
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

              /// Here is the text field for the pseudo
              /// It is there that we add the controller, and all components of the widget that the user sees on the screen for the pseudo
              FormTextField(
                hidden: false,
                errorMessage: messageErrorPseudo,
                label: "Pseudo :",
                labelHint: "Entrez votre pseudo",
                text: '',
                textEditingController: textEditingControllerForPseudo,
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

              /// Container which displays a message in order to prevent the user that if he continues, he accepts the terms
              Container(
                margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: const Text(
                  "En vous inscrivant, vous acceptez nos conditions d'utilisation",
                  textAlign: TextAlign.center,
                ),
              ),

              /// This widget displays the button to submit the registration
              /// When the user clicks on it, it calls the function submitSignup which contains all we have to do for adding and verifying the new user parameters
              SignupButton(
                onPressed: submitSignup,
                text: 'S\'inscrire',
              ),

              /// If the user has done a mistake and went to the wrong page,
              /// he can go to the connection page by clicking the following hyperlink
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
              ),
            ],
          ),
        )
    );
  }

  /// Function called when the user submits its form.
  /// If the form is correct and the user is well created, a SnackBar is showing that the registration went well.
  void submitSignup () {
    //TODO : Implement the code which create the user in the database.
    //TODO : If it goes well, we display the SnackBar on the home page which is already implemented as we can see below.

    /// Redirect the user on the home page
    Navigator.pushNamed(context, "/");

    /// Displays the SnackBar to confirm the user's registration.
    /// It automatically disappear after 5 seconds.
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
            title: 'Inscription réalisée\n',
            text: "Bienvenue sur SOLID'R !\n\nVous pouvez dès à présent vous connecter sur votre espace.",
          ),
          duration: Duration(seconds: 5),
        )
    );
  }
}
