import 'package:flutter/material.dart';

class MessageSnackbar extends StatefulWidget {
  String title;
  String text;
  MessageSnackbar({Key? key, required this.title, required this.text}) : super(key: key);
  @override
  _MessageSnackbarState createState() => _MessageSnackbarState();
}

/* You have to create the snackbar first and set the content with it. */
class _MessageSnackbarState extends State<MessageSnackbar> {

  @override
  Widget build(BuildContext context) {
    return template();
  }

  /// Widget building the message of the snackbar.
  Widget template() {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column (
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
    );
  }
}