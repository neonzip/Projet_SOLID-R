import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// Widget which displays the TSTD' slogan.
class SloganLaunchHome extends StatelessWidget {
  const SloganLaunchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AutoSizeText("Avançons ensemble vers un sport\n", style: TextStyle(fontSize: 18, color: Colors.white)),
          AutoSizeText("+ inclusif\n+ responsable\n+ solidaire", style: TextStyle(fontSize: 20, color: Colors.yellow)),
        ],
      ),
    );
  }
}