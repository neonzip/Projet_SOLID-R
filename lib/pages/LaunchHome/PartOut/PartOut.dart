import 'package:flutter/material.dart';

import 'SigninWithOtherAccountButton.dart';


/// Widget which displays The signin with an account, outside the app.
class PartOut extends StatelessWidget {
  const PartOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SigninWithOtherAccountButton(
              onPressed: () {
                // TODO: Do the signin with facebook account
              },
              name: "Facebook",
              logo: "assets/LogoNetworks/facebook.png"
          ),
          SigninWithOtherAccountButton(
              onPressed: () {
                // TODO : Do the signin with google account
              },
              name: "Google",
              logo: "assets/LogoNetworks/google.png"
          ),
        ]
    );
  }
}