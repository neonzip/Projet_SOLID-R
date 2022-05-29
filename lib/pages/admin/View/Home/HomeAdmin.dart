import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Projects/ListProjectViewAdmin.dart';
import 'package:projet_solid_r/pages/admin/view/Projects/ProjectCharts.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../../user/view/Home/ContainerWithBackground.dart';
import '../Profile/ProfileAdmin.dart';


/// Widget view which builds the entire widget for the home of the admin part.
class HomeAdmin extends StatefulWidget {
  final UserModel user;                 // User
  const HomeAdmin({Key? key, required this.user}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

/// Widget state which builds the entire widget for the home of the admin part.
class _HomeAdminState extends State<HomeAdmin> {

  @override
  Widget build(BuildContext context) {
    String pseudo = widget.user.userNickName;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: appBar(),

            /// The customized widget ContainerWithBackground is created to add a background to the page we want to show.
            body: ContainerWithBackground(
              content: Center (
                  child: SingleChildScrollView(
                    child: Container(
                      width: 500,
                      padding: const EdgeInsets.all(15),
                      margin: MediaQuery.of(context).orientation == Orientation.landscape ? const EdgeInsets.fromLTRB(10, 100, 10, 10) : const EdgeInsets.fromLTRB(10, 150, 10, 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10), //border corner radius
                      ),
                      child: Column(
                          children: [
                            Text("Bonjour $pseudo",
                                style: const TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                  color: Colors.black,
                                  fontSize: 20.0,
                                )
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                              // TODO : Here we can add the graph instead of an empty container
                              child: ProjectCharts(
                                titre: "Nombre de personnes par projet",
                                data: Map<String, double>(),
                              ),
                            )
                          ]
                      ),
                    ),
                  )
              ),
            ),

            /// Menu at the bottom with the 2 other buttons "Projets" and "Favoris".
            bottomNavigationBar: MediaQuery.of(context).orientation == Orientation.portrait ? BottomAppBar(
              color: Colors.white,
              elevation: 0,
              child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  /// Button that redirects the user to the projects
                  SizedBox(
                    height: 100,
                    width: 100,
                    child:
                    /* Projects button. */
                    buttonHomeProjectsTemplate(),
                  ),
                ],
              ),
            ) : null,

            /// Button to click if the user wants to create a new project
            floatingActionButton: Wrap(
              direction: Axis.vertical, //use vertical to show  on vertical axis
              children: [
                FloatingActionButton(
                  heroTag: "addProject",
                  onPressed: () {
                    Navigator.pushNamed(context, "/admin/project/add");
                  },
                  tooltip: 'Ajouter un projet',
                  splashColor: const Color(0xFF0725A5),
                  child: const Icon(Icons.add, color: Color(0xFF0725A5), ),
                  backgroundColor: Colors.yellow,
                  elevation: 5,
                ),
                Visibility(
                    visible: MediaQuery.of(context).orientation == Orientation.landscape,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: buttonHomeProjectsTemplate(),
                    )
                )
              ],
            )

        )
    );
  }

  /// Floating action button for projects.
  /// When the user clicked on it, he is redirected on his projects page.
  Widget buttonHomeProjectsTemplate() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: FloatingActionButton(
          heroTag: "projects",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ListProjectViewAdmin(user: widget.user)));
            //Navigator.pushNamed(context, "/admin/projects");
          },
          tooltip: 'Projets',
          splashColor: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.analytics),
              Visibility(
                visible: MediaQuery.of(context).orientation == Orientation.portrait,
                child: const Text("Projets"),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF0725A5),
          elevation: 5,
        )
    );
  }

  /// Function that builds the entire appbar.
  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF0725A5),
      title: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logo_solid_R.png"),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFF0725A5),
              ),
            ),
            const Text("Accueil",
              textAlign: TextAlign.left,
            ),
            const Text(""),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ProfileAdmin(user: widget.user)));
                      //Navigator.pushNamed(context, "/admin/profile");
                    },
                    child: Column(
                      children: const [
                        Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white),
                        Text(
                            "Profil",
                            style: TextStyle(color:Colors.white))
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}