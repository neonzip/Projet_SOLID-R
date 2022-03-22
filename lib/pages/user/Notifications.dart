import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/NotificationFrequencyButton.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  /// Widget building the part with the question about the frequency of reminder to donate.
  Widget containerFrequency() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fréquence des rappels de dons :",
            textAlign: TextAlign.justify,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
              Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /* "Jamais" */
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 5, 5),
                      width: 120,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: //ButtonStyle
                        ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: const BorderSide(width: 1.0, color: Colors.black),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Text(
                          "Jamais",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),

                    /* 10 km */
                    NotificationFrequencyButton(
                      onPressed: () {},
                      primaryTitle: "Sportif occasionnel",
                      secondaryTitle:  "10 km",
                    ),

                    /* 20 km */
                    NotificationFrequencyButton(
                      onPressed: () {},
                      primaryTitle: "Sportif du dimanche",
                      secondaryTitle: "20 km",
                    ),

                    /* 40 km */
                    NotificationFrequencyButton(
                      onPressed: () {},
                      secondaryTitle: "40 km",
                      primaryTitle: "Sportif au top",
                    ),

                    /* 60 km */
                    NotificationFrequencyButton(
                      onPressed: () {},
                      secondaryTitle: "60 km",
                      primaryTitle: "Niveau des champions",
                    ),
                  ]
              )
          )
        ]
    );
  }

  /// Widget building the container with the question about enabling notifications when a project's pool is reached.
  Widget containerPoolNotification () {
    return Container (
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child:
      Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "M'avertir lorsque la cagnotte d'un projet que j'ai soutenu est remplie ?",
            textAlign: TextAlign.justify,
          ),
          Row (
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: //ButtonStyle
                  ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(width: 1.0, color: Colors.black),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Text(
                    "Oui",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child:
                ElevatedButton(
                  onPressed: () {},
                  style: //ButtonStyle
                  ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(width: 1.0, color: Colors.black),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Text(
                    "Non",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView (
          child:
          Column(
            children: [
              /* Part about frequency of reminder for donation. */
              containerFrequency(),

              /* Part about notifications when a project reached its goal pool. */
              containerPoolNotification(),
            ],
          ),
        ),
      ),
    );
  }
}