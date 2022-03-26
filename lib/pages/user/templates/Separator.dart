import 'package:flutter/material.dart';

class Separator extends StatelessWidget {

  /* Blue horizontal line separating the two parts of the main page. */
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFF0725A5),
      height: 50,
      thickness: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}