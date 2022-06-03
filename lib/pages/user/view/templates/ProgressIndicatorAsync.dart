import 'package:flutter/material.dart';

/// Widget which builds a divider text in order to separate multi parts of a page.
/// A simple line.
class ProgressIndicatorAsync extends StatelessWidget {
  const ProgressIndicatorAsync({Key? key}) : super(key: key);

  /* Blue horizontal line separating the two parts of the main page. */
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xD50725AB),
      ),
      );
  }
}