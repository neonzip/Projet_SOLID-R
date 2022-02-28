import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget buttonHomeActivitiesTemplate() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, "/activities");
      },
      tooltip: 'Activité',
      splashColor: Colors.yellow,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      icon: const Icon(Icons.directions_run),
      backgroundColor: const Color(0xFF0725A5),
      label: const Text("Activité"),
      elevation: 2.0,
    );
  }

  /// Widget building the favorites button.
  Widget buttonHomeFavoritesTemplate() {
    return TextButton.icon(
      style: TextButton.styleFrom(
        primary: Colors.black,
        minimumSize: const Size(0, 80),
        padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      ),
      icon: const Icon(Icons.favorite),
      label: const Text("Favoris"),
      onPressed: () {
        Navigator.pushNamed(context, "/favorites");
      },
    );
  }

  /// Widget building the projects button.
  Widget buttonHomeProjectsTemplate() {
    return TextButton.icon(
      icon: const Icon(Icons.list_alt),
      style: TextButton.styleFrom(
        primary: Colors.black,
        minimumSize: const Size(0, 80),
        padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
      ),
      label: const Text("Projets"),
      onPressed: () {
        Navigator.pushNamed(context, "/projects");
      },
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

                Text(" €",
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
                  " km",
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
      ),

      /* Floating button for Activities. */
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: buttonHomeActivitiesTemplate(),
    ),

      /* Position in the middle our button "Activités". */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /* Menu at the bottom with the 2 other buttons "Projets" and "Favoris". */
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            /* Favorites button. */
            buttonHomeFavoritesTemplate(),

            /* Projects button. */
            buttonHomeProjectsTemplate(),        //TextButton.icon: const Icon(Icons.menu), onPressed: () {},),
          ],
        ),
      )
    );
  }
}
