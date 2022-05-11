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
    return widgetTemplate();
  }

  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget widgetTemplate() {
    return Container (
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.3),
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
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.2),
            Colors.white,
            //Colors.white,
          ],
        )
      ),
    ),
    widget.content,
    ])
    );
  }
}