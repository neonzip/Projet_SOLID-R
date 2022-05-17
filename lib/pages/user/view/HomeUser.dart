import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/bazar/Project/SelectedAssociationProjects.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import 'templates/Home/ContainerWithBackground.dart';
import 'templates/Home/YellowBubbleMoney.dart';
import 'templates/Home/YellowBubbleKilometers.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {

  /// Floating action button "Activités"
  Widget buttonHomeActivitiesTemplate() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "activity",
        onPressed: () {
          Navigator.pushNamed(context, "/user/activities");
        },
        tooltip: 'Activité',
        splashColor: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.directions_run),
            Text("Activité"),
          ],
        ),
        backgroundColor: const Color(0xFF0725A5),
        elevation: 5,
      )
    );
  }

  /// Widget building the favorites button.
  Widget buttonHomeFavoritesTemplate() {
    return FloatingActionButton(
      heroTag: "favorites",
      onPressed: () {
        Navigator.pushNamed(context, "/user/favorites");
      },
      tooltip: 'Favoris',
      splashColor: Colors.indigo,
      backgroundColor: Colors.transparent,
      focusElevation: 0,
      hoverElevation: 0,
      hoverColor: Colors.yellow,
      highlightElevation: 0,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite, color: Colors.black,),
          Text("Favoris",
          style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

  /// Widget building the projects button.
  Widget buttonHomeProjectsTemplate() {
    return FloatingActionButton(
      heroTag: "projects",
      onPressed: () {
        Navigator.pushNamed(context, "/user/projects/section=solidarity");
      },
      tooltip: 'Projets',
      splashColor: Colors.indigo,
      backgroundColor: Colors.transparent,
      hoverColor: Colors.yellow,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.list_alt, color: Colors.black,),
          Text("Projets",
            style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFF0725A5),
            title: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/user/APropos");
                    },
                    child: Container(
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
                  ),
                  const Text("Accueil",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(10),
                      child: FittedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/user/profile");
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
          ),

          //////////////////////////////////////////////////////
          //////////////////////////////////////////////////////

          body: ContainerWithBackground(
            content: Center (
                child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      padding: MediaQuery.of(context).orientation == Orientation.landscape ? const EdgeInsets.only(top:10) : const EdgeInsets.only(top:150),
                      width: 500,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10), //border corner radius
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.all(5),
                                child: const Text("Bonjour pseudo",
                                    style: TextStyle(
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
                                )
                            ),

                            /* Yellow bubble containing the money that the user can make to a project. */
                            YellowBubbleMoney(
                              value: 500.toString(),
                            ),

                            /* Yellow bubble containing the kilometers traveled. */
                            YellowBubbleKilometers(
                              valueKilometers: 2500.toString(),
                            ),

                            /* Blue horizontal line separating the two parts of the main page. */
                            const SeparatorWithText(text: "Ils nous font confiance"),

                            /* Building a grid with the logos of associations. */
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10), //border corner radius
                              ),
                              margin: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                              height: MediaQuery.of(context).size.height / 3,
                              child: loadImages(),
                            ),
                          ],
                        ),
                      )

                    )
                )
            ),
          ),

          /* Menu at the bottom with the 2 other buttons "Projets" and "Favoris". */
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation: 0,
            child:
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child:
                  /* Favorites button. */
                  buttonHomeFavoritesTemplate(),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: buttonHomeActivitiesTemplate(),
                ),

                SizedBox(
                  height: 100,
                  width: 100,
                  child:
                  /* Projects button. */
                  buttonHomeProjectsTemplate(),
                ),
              ],
            ),
          )
      )
    );
  }

  /// /////////////////////////////////////////////////////////////
  /// ALL methods to build the gridView with the images/assets ///
  /// /////////////////////////////////////////////////////////////
  /// https://himdeve.com/flutter-tutorials/flutter-tutorials-1-9-gridview-slivergrid-gallery/

  Widget _buildImageWidget(String imagePath, int associationID) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero, // Set this
          padding: EdgeInsets.zero, // and this
          elevation: 0,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            //height: 10,
            //width: 10,
          ),

        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SelectedAssociationProjects(associationID: associationID)));
        },
      ),
    );
  }

  Widget loadImages() {
    return GridView(
      primary: false,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10),
      children: [
        // TODO : To change with the images of the DB.
        // TODO : Place the images in the folder written below for example.

        _buildImageWidget("assets/LogoAssociation/logo4.jpg", 3),
        _buildImageWidget("assets/LogoAssociation/logo2.jpg", 2),
        _buildImageWidget("assets/LogoAssociation/logo1.jpg", 1),
      ],
    );
  }
/// /////////////////////////////////////////////////////////////
}
