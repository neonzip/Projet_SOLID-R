import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  final void Function()? onPressed;

  const SeeMoreButton({Key? key, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return buttonSeeMore();
  }

  /// Button to see more details about the specific project.
  /// Called "Voir plus".
  Widget buttonSeeMore() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
            label: const Text(
              "Voir plus",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.menu_open, color: Colors.white),
          ),
        )
    );
  }
}