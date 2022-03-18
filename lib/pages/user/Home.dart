import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget buttonHomeActivitiesTemplate() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        heroTag: "activity",
        onPressed: () {
          Navigator.pushNamed(context, "/activities");
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
        Navigator.pushNamed(context, "/favorites");
      },
      tooltip: 'Favoris',
      splashColor: Colors.yellow,
      backgroundColor: Colors.transparent,
      focusElevation: 0,
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
        Navigator.pushNamed(context, "/projects/section=solidarity");
      },
      tooltip: 'Projets',
      splashColor: Colors.indigo,
      backgroundColor: Colors.transparent,
      focusElevation: 0,
      highlightElevation: 0,
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

  /// Yellow bubble containing the kilometers traveled.
  Widget yellowBubbleKilometers() {
    return Container(
      child:
      Column (
          children: [
            const Text("Kilomètres parcourus :",
                style: TextStyle(fontSize: 20)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("12000",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                ),

                Text(" km",
                    style: TextStyle(fontSize: 20)
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
        //more than 50% of width makes circle
      ),
    );
  }

  /// Yellow bubble containing the donations that the user made.
  Widget yellowBubbleDonations() {
    return Container(
      child:
      Column(
        children: [
          const Text(
              "Dons réalisés :",
              style: TextStyle(fontSize: 20)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "43",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold)
              ),

              Text(
                  " €",
                  style: TextStyle(fontSize: 20)
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)
        //more than 50% of width makes circle
      ),
      padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
      margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0725A5),
          title: Container(
            padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    const Image(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/logo_solid_R.png")
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
                          Navigator.pushNamed(context, "/profile");
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

      body: Center (
        child: SingleChildScrollView(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child: const Text("Bonjour pseudo",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )
                    )
                ),

                /* Yellow bubble containing the kilometers traveled. */
                yellowBubbleKilometers(),

                /* Yellow bubble containing the donations that the user made. */
                yellowBubbleDonations(),

                /* Blue horizontal line separating the two parts of the main page. */
                const Divider(
                  color: Colors.blue,
                  height: 50,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),

                /* Text "Ils nous font confiance". */
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(5),
                    child: const Text("Ils nous font confiance : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )
                    )
                ),
              ],
            ),
          )
        )
      ),

      /* Menu at the bottom with the 2 other buttons "Projets" and "Favoris". */
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
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
    );
  }
}
