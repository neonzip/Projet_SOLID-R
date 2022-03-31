import 'package:flutter/material.dart';
import '../../view/templates/Profile/LogoutButton.dart';
import '../../view/templates/Profile/ProfileButton.dart';
import '../../view/templates/Separator.dart';

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
        borderRadius: BorderRadius.circular(10), //border corner radius
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.6), //color of shadow
            blurRadius: 3, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
        ],
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
        borderRadius: BorderRadius.circular(10), //border corner radius
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.6), //color of shadow
            blurRadius: 3, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
        ],
      ),
    );
  }

  /// Widget building the projects button.
  Widget buttonProjectsTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "Projets soutenus",
        iconButton: Icons.update,
        onPressedButton: () {
          Navigator.pushNamed(context, "/projects/section=formal");
        },
      positionButton: 3,
    );
  }

  /// Widget building the actions button.
  Widget buttonDoneActionsTemplate() {
    return ProfileButton(
        onPressedButton: () {
          Navigator.pushNamed(context, "/activityHistory");
        },
        widthButton: widthButtons,
        textButton: "Activités réalisées",
        iconButton: Icons.insights,
      positionButton: 2,
    );
  }

  /// Widget building the "A propos" button.
  Widget buttonAProposTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "A propos",
        iconButton: Icons.info_outline,
        onPressedButton: () {},
      positionButton: 4,
    );
  }

  /// Widget building the information button.
  Widget buttonInformationTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "Mes informations",
        iconButton: Icons.account_circle_outlined,
        onPressedButton: () {
          Navigator.pushNamed(context, "/myInformation");
        },
        positionButton: 0,
    );
  }

  /// Widget building the Notification button.
  Widget buttonNotificationTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "Notifications",
        iconButton: Icons.notifications_none,
        onPressedButton: () {
          Navigator.pushNamed(context, "/notifications");
        }, positionButton: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF1FF),
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
                const Separator(),

                /* List of buttons */
                Table(
                  children: [
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child: /* Button "Mes informations" */
                            buttonInformationTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child:
                            /* Button "Notifications */
                            buttonNotificationTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child:

                            /* Button "Activités réalisées */
                            buttonDoneActionsTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child:

                            /* Button "Projets soutenus" */
                            buttonProjectsTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child:
                            /* Button "A propos" */
                            buttonAProposTemplate(),
                          )
                        ]
                    ),
                    const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child:

                            /* Button "Déconnexion" to log out */
                            LogoutButton(
                              widthButton: widthButtons,
                            ),
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
