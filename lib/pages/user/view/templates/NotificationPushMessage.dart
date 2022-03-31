import 'package:flutter/material.dart';
import 'package:projet_solid_r/Functions/Notification.dart';

class NotificationPushMessage extends StatefulWidget {
  final String title;
  final String content;
  const NotificationPushMessage({Key? key, required this.title, required this.content}) : super(key: key);
  @override
  _NotificationPushMessageState createState() => _NotificationPushMessageState();
}

class _NotificationPushMessageState extends State<NotificationPushMessage> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Notification",
      onPressed: () {
        sendNotification(title: widget.title,
            body: widget.content,
        );
      },
      icon: const Icon(Icons.notification_important_rounded),
    );
  }
}

/*IconButton(
tooltip: "Notif",
onPressed: () {
sendNotification(title: "Votre activité actuelle", body: "Vous avez parcouru $_kmWalk en $_actualTime secondes. Votre vitesse est de ${_location.speed != null && _location.speed! * 3600 / 1000 > 0
? (_location.speed! * 3600 / 1000).toStringAsFixed(2)
    : 0} KM/h");
},
icon: const Icon(Icons.notification_important_rounded),
)*/