import 'dart:developer';

import 'package:flutter/material.dart';

class NotificationFrequencyButton extends StatefulWidget {
  String primaryTitle;
  String secondaryTitle;
  void Function()? onPressed;
  NotificationFrequencyButton({Key? key, required this.primaryTitle, required this.secondaryTitle, required this.onPressed}) : super(key: key);
  @override
  _NotificationFrequencyButtonState createState() => _NotificationFrequencyButtonState();
}

class _NotificationFrequencyButtonState extends State<NotificationFrequencyButton> {

  @override
  Widget build(BuildContext context) {
    return buttonNotificationTemplate();
  }

  /// Widget building the notifcation frequency button.
  Widget buttonNotificationTemplate() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      width: 120,
      height: 80,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: //ButtonStyle
          ElevatedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(width: 1.0, color: Colors.black),
            padding: const EdgeInsets.all(10),
          ),
          child: Column (
            children: [
              Text(
                widget.primaryTitle,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.secondaryTitle,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          )
      ),
    );
  }
}