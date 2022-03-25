import 'package:flutter/material.dart';

class NotificationFrequencyButton extends StatefulWidget {
  String primaryTitle;
  String secondaryTitle;
  bool isSelected;
  void Function()? onPressed;
  NotificationFrequencyButton({Key? key, required this.primaryTitle, required this.secondaryTitle, required this.onPressed, required this.isSelected}) : super(key: key);
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
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      height: 50,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style:
          ElevatedButton.styleFrom(
            primary: widget.isSelected ? const Color(0xFF0725A5) : Colors.white,
            side: BorderSide(
                width: 1.0,
                color: widget.isSelected ? const Color(0xFF0725A5) : Colors.black,
            ),
            padding: const EdgeInsets.all(10),
          ),
          child: Row (
            children: [
              Text(
                widget.primaryTitle,
                style: TextStyle(
                    color: widget.isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                widget.secondaryTitle,
                style: TextStyle(color: widget.isSelected ? Colors.white : Colors.black),
              )
            ],
          )
      ),
    );
  }
}