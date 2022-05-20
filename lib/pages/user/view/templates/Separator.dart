import 'package:flutter/material.dart';

/// Widget which builds a divider text in order to separate multi parts of a page.
/// A simple line.
class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

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