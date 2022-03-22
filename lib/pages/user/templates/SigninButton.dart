import 'dart:developer';

import 'package:flutter/material.dart';

class SigninButton extends StatefulWidget {
  void Function()? onPressed;

  SigninButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  _SigninButtonState createState() => _SigninButtonState();
}

class _SigninButtonState extends State<SigninButton> {

  @override
  Widget build(BuildContext context) {
    return buttonSigninTemplate();
  }

  /// Widget building the button to signin.
  Widget buttonSigninTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
        child: const Text(
          "Se connecter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}