import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/LaunchHome/ImageWithSlogan/GradientLaunchHome.dart';
import 'package:projet_solid_r/pages/LaunchHome/ImageWithSlogan/ImageLaunchHome.dart';
import 'package:projet_solid_r/pages/LaunchHome/ImageWithSlogan/SloganLaunchHome.dart';

/// Widget which displays the blue image with the slogan in the main launch home.
class ImageWithSlogan extends StatelessWidget {
  const ImageWithSlogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(children: const <Widget>[
        LaunchHomeImage(),
        GradientLaunchHome(),
        SloganLaunchHome(),
      ]),
    );
  }
}