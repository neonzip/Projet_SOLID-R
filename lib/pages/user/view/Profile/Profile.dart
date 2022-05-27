import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/HomeAdmin.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/HistoryActivityLandscape.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/HistoryActivityPortrait.dart';
import 'package:projet_solid_r/pages/user/view/Profile/APropos/AProposPortrait.dart';
import 'package:projet_solid_r/pages/user/view/Profile/MyInformation/MyInformationPortrait.dart';
import '../templates/Home/YellowBubbleMoney.dart';
import '../templates/Profile/LogoutButton.dart';
import '../templates/Profile/ProfileButton.dart';
import '../templates/Separator.dart';
import 'APropos/AProposLandscape.dart';
import 'MyInformation/MyInformationLandscape.dart';
import 'Notifications/NotificationsLandscape.dart';
import 'Notifications/NotificationsPortrait.dart';
class Profile extends StatefulWidget {
  final UserModel user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String title = "Profil - Mes informations";
  //String route = '/';
  late Widget widgetLandscapeSecondPage;
  /* Constant used for the text size */
  static const double fontSize = 20;

  /* Constants used for buttons */
  static const double widthButtons = double.infinity;

  /// Booleans used for the landscape mode in order to change the color of the selected button/page.
  /// Now, the user can know on which page he is looking at.
  /// By default, the user is looking at the information page.
  bool isMyInfo = true;
  bool isNotif = false;
  bool isHistory = false;
  bool isApropos = false;

  int currentPosition = 0;


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
            children: [
              Text(
                  widget.user.userTotalDonations.toString(),
                  style: const TextStyle(
                      fontSize: fontSize + 5,
                      fontWeight: FontWeight.bold)
              ),

              const Text(
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
    return /* Yellow bubble containing the money that the user can make to a project. */
      YellowBubbleMoney(
        value: widget.user.userPurse.toString(),
      );
  }

  /// Widget building the projects button.
  Widget buttonProjectsTemplate() {
    return ProfileButton(
        widthButton: widthButtons,
        textButton: "Projets soutenus",
        iconButton: Icons.update,
        onPressedButton: () {
          Navigator.pushNamed(context, "/user/projects/section=formal");
        },
      positionButton: 3,
    );
  }

  /// Widget building the actions button.
  Widget buttonDoneActionsTemplate() {
    return ProfileButton(
      isSelected: isHistory,
        onPressedButton: () {
          setState(() {
            isMyInfo = isNotif = isApropos = false;
            isHistory = true;
          });
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            //Navigator.pushNamed(context, "/user/activityHistory");
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const HistoryActivityPortrait()));
          }
          else {
            //TODO:
            //route = "/user/activityHistory";
            widgetLandscapeSecondPage = const HistoryActivityLandscape();
            title = "Profil - Activitées réalisées";
          }
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
      isSelected: isApropos,
        widthButton: widthButtons,
        textButton: "À propos",
        iconButton: Icons.info_outline,
        onPressedButton: () {
          setState(() {
            isMyInfo = isNotif = isHistory = false;
            isApropos = true;
          });
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const AProposPortrait()));
            //Navigator.pushNamed(context, "/user/APropos");
          }
          else {
            //TODO:
            //route = "/user/APropos";
            widgetLandscapeSecondPage = const AProposLandscape();
            title = "Profil - À propos";
          }
        },
      positionButton: 4,
    );
  }

  /// Widget building the information button.
  Widget buttonInformationTemplate() {
    return ProfileButton(
      isSelected: isMyInfo,
        widthButton: widthButtons,
        textButton: "Mes informations",
        iconButton: Icons.account_circle_outlined,
        onPressedButton: () {
          setState(() {
            isApropos = isNotif = isHistory = false;
            isMyInfo = true;
          });
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MyInformationPortrait(user: widget.user)));
            //Navigator.pushNamed(context, "/user/myInformation");
          }
          else {
            //TODO:
            //route = "/user/myInformation";
            widgetLandscapeSecondPage =  MyInformationLandscape(user: widget.user);
            title = "Profil - Mes informations";
          }
        },
        positionButton: 0,
    );
  }

  /// Widget building the Notification button.
  Widget buttonNotificationTemplate() {
    return ProfileButton(
      isSelected: isNotif,
        widthButton: widthButtons,
        textButton: "Notifications",
        iconButton: Icons.notifications_none,
        onPressedButton: () {
          setState(() {
            isApropos = isMyInfo = isHistory = false;
            isNotif = true;
          });
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const NotificationsPortrait()));
            //Navigator.pushNamed(context, "/user/notifications");
          }
          else {
            //TODO:
            //route = "/user/notifications";
            widgetLandscapeSecondPage = const NotificationsLandscape();
            title = "Profil - Notifications";
          }
        },
      positionButton: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLargeScreen = false;

    return Scaffold(
      backgroundColor: const Color(0xFFEBF1FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: (MediaQuery.of(context).orientation == Orientation.portrait) ? const Text("Profil") : Text(title),
        centerTitle: true,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery
            .of(context)
            .size
            .width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        return Row(
          children: <Widget>[
            Expanded(
              child: profile(),
            ),
            isLargeScreen ?  Expanded(child: widgetLandscapeSecondPage) : Container(color: const Color(0xFF0725A5),),
          ],
        );
      }),
    );
  }

  Widget profile() {
    return Center (
        child: SingleChildScrollView(
            child: Container (
              padding: const EdgeInsets.all(10),
              width: 500,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(5),
                      child: Text(widget.user.userNickName,
                          style: const TextStyle(
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
                      TableRow(
                        children: [
                          /* Button to access to the admin page if the user is one of them. */
                          Visibility(
                            child: widget.user.userIsAdmin ? buttonGoToAdminPage() : Container(),
                          ),
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
    );
  }

  /// Widget to go to admin page.
  Widget buttonGoToAdminPage() {
    return Container(
      width: widthButtons,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:
      ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, "/admin/home");
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HomeAdmin(user: widget.user)));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        child: const Text(
          "Continuer en tant qu'administrateur",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void initState() {
    widgetLandscapeSecondPage = MyInformationLandscape(user: widget.user);
    super.initState();
  }
}