import 'dart:developer';

import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  const SignupButton({Key? key}) : super(key: key);
  @override
  _SignupButtonState createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {

  @override
  Widget build(BuildContext context) {
    return buttonSignupTemplate();
  }

  /// Widget building the button to signup.
  Widget buttonSignupTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        child: const Text(
          "S'inscrire avec un email",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}