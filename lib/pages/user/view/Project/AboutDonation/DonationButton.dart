import 'package:flutter/material.dart';

class DonationButton extends StatelessWidget {
  final String idProject;
  final String text;
  final void Function()? onPressedButton;

  const DonationButton({Key? key, required this.idProject, required this.onPressedButton, required this.text}) : super(key: key);

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
            onPressed: onPressedButton,
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), ),
            label: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            icon: const Icon(Icons.volunteer_activism, color: Colors.black),
          ),
        )
    );
  }
}