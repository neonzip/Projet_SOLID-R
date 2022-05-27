import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final double width;
  const LogoutButton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
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