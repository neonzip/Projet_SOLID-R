import 'dart:developer';

import 'package:flutter/material.dart';

class DonationButton extends StatefulWidget {
  const DonationButton({Key? key}) : super(key: key);
  @override
  _DonationButtonState createState() => _DonationButtonState();
}

class _DonationButtonState extends State<DonationButton> {
  @override
  Widget build(BuildContext context) {
    return buttonDonate();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget buttonDonate() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), ),
            label: const Text(
              "Donner",
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(Icons.volunteer_activism, color: Colors.black),
          ),
        )
    );
  }
///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter
}