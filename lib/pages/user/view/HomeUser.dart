import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Project/SelectedAssociationProjects.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import '../model/UserModel.dart';
import 'Profile/Profile.dart';
import 'templates/Home/ContainerWithBackground.dart';
import 'templates/Home/YellowBubbleMoney.dart';
import 'templates/Home/YellowBubbleKilometers.dart';

/// Widget view which builds the entire widget for the home of the user part.
class HomeUser extends StatefulWidget {
  final UserModel user;
  const HomeUser({Key? key, required this.user}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

/// Widget state which builds the entire widget for the home of the user part.
class _HomeUserState extends State<HomeUser> {

  /// Floating action button "Activités".
  /// When the user clicks on it, he is automatically redirected to the activity page.
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
          children: [
            const Icon(Icons.directions_run),
            Visibility(
                visible: MediaQuery.of(context).orientation == Orientation.portrait,
                child: const Text("Activité"),
            )
          ],
        ),
        backgroundColor: const Color(0xFF0725A5),
        elevation: 5,
      )
    );
  }

  /// Widget building the favorites button.
  /// This button redirects to the page which displays all the favorite projects of the user.
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
  /// It redirects to the page where the user can see all the solidarity project that the association wants to show.
  Widget buttonHomeProjectsTemplate() {
    return FloatingActionButton(
      heroTag: "projects",
      onPressed: () {
        Navigator.pushNamed(context, "/user/projects/section=solidarity");
      },
      tooltip: 'Projets',
      splashColor: Colors.indigo,
      backgroundColor: MediaQuery.of(context).orientation == Orientation.landscape ? Colors.white : Colors.transparent,
      hoverColor: Colors.yellow,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.list_alt, color: Colors.black,),
          Visibility(
              visible: MediaQuery.of(context).orientation == Orientation.portrait,
              child: const Text(
                "Projets",
                style: TextStyle(color: Colors.black),
              ),
          )

        ],
      ),
    );
  }

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
                                child: Text("Bonjour $pseudo",
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
                                )
                            ),

                            /// Yellow bubble containing the money that the user can make to a project.
                            YellowBubbleMoney(
                              value: widget.user.userPurse.toString(),
                            ),

                            /// Yellow bubble containing the kilometers traveled.
                            YellowBubbleKilometers(
                              valueKilometers: widget.user.userTotalDistance.toString(),
                            ),

                            /// Blue horizontal line separating the two parts of the main page.
                            const SeparatorWithText(text: "Ils nous font confiance"),

                            /// Building a grid with the logos of associations.
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

          floatingActionButton: MediaQuery.of(context).orientation == Orientation.landscape ? Wrap(
            direction: Axis.vertical, //use vertical to show  on vertical axis
            children: [
              buttonHomeActivitiesTemplate(),
              buttonHomeProjectsTemplate(),
            ],
          ) : null,

          /// Menu at the bottom with the 2 other buttons "Projets" and "Favoris".
          bottomNavigationBar:  MediaQuery.of(context).orientation == Orientation.portrait ? BottomAppBar(
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
          ) : null,
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Profile(user: widget.user)));
                      //Navigator.pushNamed(context, "/user/profile");
                    },
                    child: Column(
                      children: const [
                        Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white
                        ),
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
