import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Profile/MyInformation/MyInformationPortrait.dart';

import '../user/model/UserModel.dart';
import '../user/view/HomeUser.dart';
import '../user/view/templates/Profile/LogoutButton.dart';
import '../user/view/templates/Profile/ProfileButton.dart';

class ProfileAdmin extends StatefulWidget {
  final UserModel user;
  const ProfileAdmin({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  /* Constant used for the text size */
  static const double fontSize = 20;

  /* Constants used for buttons */
  static const double widthButtons = double.infinity;

  /// Widget building the "A propos" button.
  Widget buttonAProposTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "À propos",
        iconButton: Icons.info_outline,
        onPressedButton: () {
          Navigator.pushNamed(context, "/user/APropos");
        },
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
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MyInformationPortrait(user: widget.user)));
          //Navigator.pushNamed(context, "/user/myInformation");
        },
        positionButton: 0,
    );
  }

  /// Widget to go to user page.
  Widget buttonGoToUserPage() {
    return SizedBox(
      width: widthButtons,
      height: 50,
      child:
      ElevatedButton(
        onPressed: () {
         // Navigator.pushNamed(context, "/user/home");
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HomeUser(user: widget.user)));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        child: const Text(
          "Continuer en tant qu'utilisateur",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// Widget building the Notification button.
  Widget buttonNotificationTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "Notifications",
        iconButton: Icons.notifications_none,
        onPressedButton: () {
          Navigator.pushNamed(context, "/admin/notifications");
        }, positionButton: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    String pseudo = widget.user.userNickName;

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
                    child: Text(pseudo,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                        )
                    )
                ),

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
                            /* Button "A propos" */
                            buttonAProposTemplate(),
                          )
                        ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child:
                            buttonGoToUserPage(),
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
