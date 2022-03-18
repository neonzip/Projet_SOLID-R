import 'dart:developer';

import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  double widthButton;
  LogoutButton({Key? key, required this.widthButton}) : super(key: key);
  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  //bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return buttonLogOutTemplate();
  }

  /// Widget building the logOut button.
  Widget buttonLogOutTemplate() {
    return SizedBox(
      width: widget.widthButton,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
        label: const Text(
          "Déconnexion",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.logout, color: Colors.white),
      ),
    );
  }
}