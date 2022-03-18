import 'dart:developer';

import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  double widthButton;
  String textButton;
  IconData iconButton;
  void Function()? onPressedButton;
  ProfileButton({Key? key, required, required this.widthButton, required this.textButton, required this.iconButton, required this.onPressedButton}) : super(key: key);
  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  IconData? get iconButton => null;


  @override
  Widget build(BuildContext context) {
    return buttonTemplate();
  }

  /// Widget building the specific button.
  Widget buttonTemplate() {
    return SizedBox(
      width: widget.widthButton,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: widget.onPressedButton,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: Text(
          widget.textButton,
          style: const TextStyle(color: Colors.black),
        ),
        icon: Icon(widget.iconButton, color: Colors.black),
      ),
    );
  }
}