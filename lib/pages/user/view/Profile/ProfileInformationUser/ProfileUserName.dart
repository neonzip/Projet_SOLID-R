import 'package:flutter/material.dart';

/// Widget displaying the user name.
class ProfileUserName extends StatelessWidget {
  final String name;

  const ProfileUserName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(5),
        child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            )
        )
    );
    }
  }