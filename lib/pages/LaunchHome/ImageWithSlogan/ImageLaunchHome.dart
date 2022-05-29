import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Widget which displays the image on the launch home.
class LaunchHomeImage extends StatelessWidget {
  const LaunchHomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(
            'assets/background.png',
          ),
        ),
      ),
    );
  }
}