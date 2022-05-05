import 'package:flutter/material.dart';
import '../user/view/templates/Home/ContainerWithBackground.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {

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
                    const Text(""),Container(
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
                    child: SizedBox(
                      width: 500,
                      child: Column(
                          children: [
                            const Text("Bonjour pseudo",
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
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                              width: double.infinity,
                              height: 50,
                              child:
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "Se connecter en tant qu'administrateur",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              width: double.infinity,
                              height: 50,
                              child:
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/user/home");
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "Se connecter en tant qu'utilisateur",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
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
                    /* Projects button. */
                    buttonHomeProjectsTemplate(),
                  ),
                ],
              ),
            ),
          floatingActionButton: FloatingActionButton(
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
    )
    );
  }

  /// Floating action button for projects
  Widget buttonHomeProjectsTemplate() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: FloatingActionButton(
          heroTag: "projects",
          onPressed: () {
            //Navigator.pushNamed(context, "/admin/projects");
          },
          tooltip: 'Projets',
          splashColor: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.analytics),
              Text("Projets"),
            ],
          ),
          backgroundColor: const Color(0xFF0725A5),
          elevation: 5,
        )
    );
  }
}
