import 'package:flutter/material.dart';

import '../../../templates/Profile/NotificationFrequencyButton.dart';

class NotificationsLandscape extends StatefulWidget {
  const NotificationsLandscape({Key? key}) : super(key: key);

  @override
  _NotificationsLandscapeState createState() => _NotificationsLandscapeState();
}

class _NotificationsLandscapeState extends State<NotificationsLandscape> {
  bool isNever = false;
  bool is10km = true;
  bool is20km = false;
  bool is40km = false;
  bool is60km = false;

  /////////////////////

  bool isNo = false;
  bool isYes = true;

  /// Widget building the part with the question about the frequency of reminder to donate.
  Widget containerFrequency() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: const Text(
              "Fréquence des rappels de dons :",
              textAlign: TextAlign.justify,
            ),
          ),
          Column (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Never */
                NotificationFrequencyButton(
                  onPressed: () {
                    setState(() {
                      is10km = is20km = is40km = is60km = false;
                      isNever = true;
                    });
                  },
                  primaryTitle: "Jamais",
                  secondaryTitle:  "",
                  isSelected: isNever,
                ),

                /* 10 km */
                NotificationFrequencyButton(
                  onPressed: () {
                    setState(() {
                      isNever = is20km = is40km = is60km = false;
                      is10km = true;
                    });
                  },
                  primaryTitle: "Sportif occasionnel",
                  secondaryTitle:  "10 km",
                  isSelected: is10km,
                ),

                /* 20 km */
                NotificationFrequencyButton(
                  onPressed: () {
                    setState(() {
                      isNever = is10km = is40km = is60km = false;
                      is20km = true;
                    });
                  },
                  primaryTitle: "Sportif du dimanche",
                  secondaryTitle: "20 km",
                  isSelected: is20km,
                ),

                /* 40 km */
                NotificationFrequencyButton(
                  onPressed: () {
                    setState(() {
                      isNever = is20km = is10km = is60km = false;
                      is40km = true;                    });
                  },
                  secondaryTitle: "40 km",
                  primaryTitle: "Sportif au top",
                  isSelected: is40km,
                ),

                /* 60 km */
                NotificationFrequencyButton(
                  onPressed: () {
                    setState(() {
                      isNever = is20km = is40km = is10km = false;
                      is60km = true;
                    });
                  },
                  secondaryTitle: "60 km",
                  primaryTitle: "Niveau des champions",
                  isSelected: is60km,
                ),
              ]
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
                  onPressed: () {
                    setState(() {
                      isNo = false;
                      isYes = true;
                    });

                  },
                  style: //ButtonStyle
                  ElevatedButton.styleFrom(
                    primary: isYes ? const Color(0xFF0725A5) : Colors.white,
                    side: BorderSide(
                        width: 0.5,
                        color: isYes ? const Color(0xFF0725A5) : Colors.black
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Text(
                    "Oui",
                    style: TextStyle(
                        color: isYes? Colors.white : Colors.black
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child:
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isYes = false;
                      isNo = true;
                    });

                  },
                  style: //ButtonStyle
                  ElevatedButton.styleFrom(
                    primary: isNo ? const Color(0xFF0725A5) : Colors.white,
                    side: BorderSide(
                        width: 0.5,
                        color: isNo ? const Color(0xFF0725A5) : Colors.black,
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Text(
                    "Non",
                    style: TextStyle(
                        color: isNo? Colors.white : Colors.black,
                    ),
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
      body: Center(
        child: SingleChildScrollView (
          child:
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                width: 500,
                child: Column(
                  children: [
                    /* Part about frequency of reminder for donation. */
                    containerFrequency(),

                    /* Part about notifications when a project reached its goal pool. */
                    containerPoolNotification(),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}