import 'package:flutter/material.dart';

class FinishedActivityAlert extends StatefulWidget {
  final void Function()? onPressedButton;
  final num coins;
  final String? kilometers;

  const FinishedActivityAlert({Key? key, required this.coins, required this.onPressedButton, required this.kilometers}) : super(key: key);
  @override
  _FinishedActivityAlertState createState() => _FinishedActivityAlertState();
}

class _FinishedActivityAlertState extends State<FinishedActivityAlert> {
  @override
  Widget build(BuildContext context) {
    return button();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget button() {
    String? km = widget.kilometers;
    num coin = widget.coins;
    return AlertDialog(
      title: const Text('Félicitations !'),
      content: Text("Vous avez parcouru $km durant votre séance. Cela vous a permis de gagner $coin ! \n Cette somme va être ajoutée a votre cagnotte. Vous pourrez la verser au projet de votre choix a tout moment."),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            widget.onPressedButton;
            Navigator.popUntil(context, ModalRoute.withName("/home"));
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}