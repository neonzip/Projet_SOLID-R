import 'package:flutter/material.dart';

class Separator extends StatelessWidget {

  /* Blue horizontal line separating the two parts of the main page. */
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.blue,
      height: 50,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}