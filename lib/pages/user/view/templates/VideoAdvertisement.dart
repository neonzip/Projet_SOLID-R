import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../model/ProjectModel.dart';

/// Widget for the video of advertisement.
/// Here are all the methods we have to applicate the ad and display it.
///
/// Here is a link about orientation screen :
/// https://flutteragency.com/how-to-lock-screen-orientation-in-flutter/
class VideoAdvertisement extends StatefulWidget {
  final ProjectModel project;

  const VideoAdvertisement({Key? key, required this.project}) : super(key: key);
  @override
  _VideoAdvertisementState createState() => _VideoAdvertisementState();
}

class _VideoAdvertisementState extends State<VideoAdvertisement> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    /// Sets the orientation screen to portrait for this page
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    /// Initializes the video in case the user confirms the donation
    /// If we do it with a link, replace the word "asset" by "network" in the function below
    controller = VideoPlayerController.asset(widget.project.projectAssociation.associationAdvertisementURL);

    controller.initialize().then((value) => {
      setState(() {
      })
    });

    /// Normally, we get a 20 second video in the DB, but to but sure, we stop time to 20 seconds here
    if (controller.value.duration.inSeconds > 20) {
      controller.seekTo(const Duration(seconds: 20));
    }

    controller.play();
  }

  @override
  dispose(){
    /// Resets the orientation screen by default when the user quit in order not to have any problem with the navigation on other next pages
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool refreshClicked = false;

    /// https://www.fluttercampus.com/guide/268/play-video-flutter-example/
    /// Displays the add with a button to quit the page.
    return Scaffold(
        backgroundColor: Colors.black,
        body: WillPopScope(
        onWillPop: () async {
          if (controller.value.isPlaying) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Vous devez attendre la fin de la vidéo pour pouvoir quitter.')));
            return false;
          }
          else {
            dispose();
            /// We can quit the page and return to the home page
            Navigator.pushNamed(context, "/user/home");
          }
          return true;
        },
        /// https://stackoverflow.com/questions/62748313/how-do-you-change-the-videoplayer-fullscreen-mode-to-landscape-instead-of-portra
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Allows the user to go to the association's website by clicking in the video
            GestureDetector(
              onTap:
              /// If the video is finished, the user can go to the web site of the ad
              TapGestureRecognizer().onTap = () async {
                if (!controller.value.isPlaying) {
                  var url = widget.project.projectAssociation.associationWebSiteURL;
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                  else {
                    throw("cannot launch URL");
                  }
                }
                else {
                  throw("Cannot launch URL because video is running.");
                }
              },
              child: AspectRatio(
                aspectRatio: 3/2,//controller.value.aspectRatio,
                child: VideoPlayer(
                  controller,
                ),
              ),
            ),
            VideoProgressIndicator(
              controller,  //video player controller
              allowScrubbing: false,
              colors: const VideoProgressColors( //video player progress bar
                backgroundColor: Color(0xFF0725A5),
                playedColor: Colors.yellow,
                bufferedColor: Color(0xFF0725A5),
              ),
              padding: EdgeInsets.zero,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.seekTo(const Duration(seconds:0));
                    controller.play();

                    setState(() {
                      refreshClicked = true;
                    });
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white60),
                ),
                IconButton(
                    onPressed: (){
                      if(controller.value.isPlaying){
                        controller.pause();
                      }else{
                        controller.play();
                      }

                      setState(() {
                        refreshClicked = false;
                      });
                    },
                    icon:Icon((controller.value.isPlaying || refreshClicked == true)?Icons.pause:Icons.play_arrow, color: controller.value.isPlaying?Colors.red:Colors.green)
                ),
              ],
            ),
          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                if (controller.value.isPlaying) {
                  /// We have to wait that the video finishes
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vous devez attendre la fin de la vidéo pour pouvoir quitter.')));
                }
                else {
                  /// We can quit the page and return to the home page
                  Navigator.pushNamed(context, "/user/home");
                }
              },
              icon: const Icon(Icons.close, color: Colors.yellow),
            ),
          ],
        )
    );
  }
}