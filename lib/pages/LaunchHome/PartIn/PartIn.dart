import 'package:flutter/material.dart';

import '../PartIn/SignupButton.dart';
import 'SigninButton.dart';

/// Widget which displays The signin et signup buttons, specific to the app.
class PartIn extends StatelessWidget {
  const PartIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SigninButton(
            onPressed:  () {
              Navigator.pushNamed(context, "/signin");
            },
          ),
          SignupButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signup");
            }, text: "S'inscrire avec un email",
          ),
        ]
    );
  }
}