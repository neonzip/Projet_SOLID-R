import 'dart:developer';

import 'package:flutter/material.dart';

class ContainerWithBackground extends StatefulWidget {
  Widget content;

  ContainerWithBackground({Key? key, required this.content}) : super(key: key);
  @override
  _ContainerWithBackgroundState createState() => _ContainerWithBackgroundState();
}

class _ContainerWithBackgroundState extends State<ContainerWithBackground> {
  @override
  Widget build(BuildContext context) {
    return widgetTemplate();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget widgetTemplate() {
    return Container (
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/exampleSport.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: <Widget>[
      Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/exampleSport.png',
          ),
        ),
      ),
    ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.white,
                ],
              )
          ),
        ),
    Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.8),
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.grey.withOpacity(0.0),
            Colors.white,
          ],
        )
      ),
    ),
    widget.content,
    ])
    );
  }
}