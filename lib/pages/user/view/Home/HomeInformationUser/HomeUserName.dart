import 'package:flutter/material.dart';

/// Widget displaying the user name.
class HomeUserName extends StatelessWidget {
  final String name;

  const HomeUserName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(5),
        child: Text("Bonjour $name",
            textAlign: TextAlign.center,
            style: const TextStyle(
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 4.0,
                  color: Colors.black54,
                ),
              ],
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            )
        )
    );
    }
  }