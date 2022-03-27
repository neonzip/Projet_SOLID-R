import 'package:flutter/material.dart';

class SignupButton extends StatefulWidget {
  void Function()? onPressed;
  String text;

  SignupButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
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
        onPressed: widget.onPressed,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}