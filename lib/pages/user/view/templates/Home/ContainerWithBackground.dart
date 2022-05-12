import 'package:flutter/material.dart';

class ContainerWithBackground extends StatefulWidget {
  final Widget content;

  const ContainerWithBackground({Key? key, required this.content}) : super(key: key);
  @override
  _ContainerWithBackgroundState createState() => _ContainerWithBackgroundState();
}

class _ContainerWithBackgroundState extends State<ContainerWithBackground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetTemplate()
    );
      widgetTemplate();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget widgetTemplate() {
    return Stack(children: <Widget>[
      getBackground(),
      getGradient(),
      widget.content,
    ]);
  }

  Container getBackground() {
    return Container (
        child: const Image(
          image: AssetImage(
            "assets/background.png",
          ),
          fit: BoxFit.cover,
          height: 300.0,
        ),
      constraints: const BoxConstraints.expand(height: 300.0),
    );
  }

  Container getGradient() {
    return Container(
      margin: const EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration:  const BoxDecoration(
        gradient:  LinearGradient(
          colors: <Color>[
            Color(0x00ffffff),
            Colors.white,
          ],
          stops: [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }
}