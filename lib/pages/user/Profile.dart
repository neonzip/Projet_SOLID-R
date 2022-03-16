import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  /* Constant used for the text size */
  static const double fontSize = 20;

  /* Constants used for buttons */
  static const double widthButtons = double.infinity;

  /// Widget building the yellow bubble which contains the user's donations.
  Widget bubbleDonationsDone() {
    return Container(
      child:
      Column(
        children: [
          const Text(
              "Dons réalisés :",
              style: TextStyle(fontSize: fontSize)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "43",
                  style: TextStyle(
                      fontSize: fontSize + 5,
                      fontWeight: FontWeight.bold)
              ),

              Text(
                  " €",
                  style: TextStyle(fontSize: fontSize)
              ),
            ],
          ),
        ],
      ),

      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
      margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
    );
  }

  /// Widget building the yellow bubble which contains the user's pool.
  Widget bubblePool () {
    return Container(
      child:
      Column (
          children: [
            const Text("Cagnotte :",
                style: TextStyle(fontSize: fontSize)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("1.00",
                    style: TextStyle(
                        fontSize: fontSize + 5,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                  " €",
                  style: TextStyle(
                      fontSize: fontSize
                  ),
                ),
              ],
            ),
          ]
      ),

      padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
      margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  /// Widget building the projects button.
  Widget buttonProjectsTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, "/projects/section=formal");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: const Text(
          "Projets soutenus",
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        icon: const Icon(Icons.update, color: Colors.black),
      ),
    );
  }

  /// Widget building the actions button.
  Widget buttonDoneActionsTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: const Text(
          "Actions réalisées",
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        icon: const Icon(Icons.insights, color: Colors.black),
      ),
    );
  }

  /// Widget building the "A propos" button.
  Widget buttonAProposTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: const Text(
          "A propos",
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        icon: const Icon(Icons.info_outline, color: Colors.black),
      ),
    );
  }

  /// Widget building the information button.
  Widget buttonInformationTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, "/myInformation");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: const Text(
          "Mes informations",
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        icon: const Icon(Icons.account_circle_outlined, color: Colors.black),
      ),
    );
  }

  /// Widget building the Notification button.
  Widget buttonNotificationTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, "/notifications");
          },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        label: const Text(
          "Notifications",
          style: TextStyle(fontSize: fontSize, color: Colors.black),
        ),
        icon: const Icon(Icons.notifications_none, color: Colors.black),
      ),
    );
  }

  /// Widget building the logOut button.
  Widget buttonLogOutTemplate() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
          label: const Text(
            "Déconnexion",
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
          icon: const Icon(Icons.logout, color: Colors.white),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Center (
        child: SingleChildScrollView(
          child: Container (
            padding: const EdgeInsets.all(10),
            width: 500,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child: const Text("Mon pseudo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                        )
                    )
                ),

                /* Yellow bubble containing the pool. */
                bubblePool(),

                /* Yellow bubble containing the donations that the user has already made. */
                bubbleDonationsDone(),

                /* Blue horizontal line separating the two parts of the account page. */
                const Divider(
                  color: Colors.blue,
                  height: 50,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),

                /* List of buttons */
                Table(
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: /* Button "Mes informations" */
                            buttonInformationTemplate(),
                          )

                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child:
                            /* Button "Notifications */
                            buttonNotificationTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child:
                            /* Button "Actions réalisées */
                            buttonDoneActionsTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child:
                            /* Button "Projets soutenus" */
                            buttonProjectsTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child:
                            /* Button "A propos" */
                            buttonAProposTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child:
                            /* Button "Déconnexion" to log out */
                            buttonLogOutTemplate(),
                          )

                        ]
                    ),
                  ],
                ),
              ],
            ),
          )
        )

      ),
    );
  }
}
