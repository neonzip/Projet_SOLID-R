import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../model/ProjectModel.dart';

class ShareButton extends StatefulWidget {
  final void Function()? onPressedButton;

  const ShareButton({Key? key, required this.onPressedButton, }) : super(key: key);
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  late VideoPlayerController controller;    // Controller of the video ad

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buttonShare();
  }


  /// Button to donate to the specific project.
  /// Called "Donner".
  Widget buttonShare() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5)),
              elevation: MaterialStateProperty.all<double?>(0.0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            label: const Text(
              "Partager",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.share, color: Colors.white),
          ),
        )
    );
  }
}