import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/View/Projects/AllProjectsView.dart';

/// https://fr.acervolima.com/flutter-onglets/?msclkid=6e1bd9dcceda11ecaf1bccadbafa9671
class ListProjectViewAdmin extends StatelessWidget {
  const ListProjectViewAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xFFD7E1FF),
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.yellow,
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white60,
              tabs: [
                Tab(text: "Non publiés"),
                Tab(text: "Tous",),
                Tab(text: "Publiés",),
              ],
            ),
            automaticallyImplyLeading: true,
            backgroundColor: const Color(0xFF0725A5),
            title: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Projets",
                    textAlign: TextAlign.left,
                  ),
                  const Text(""),Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(10),
                      child: FittedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/admin/profile");
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
          body: const TabBarView(
            children: [
              Icon(Icons.music_note),
              AllProjectsView(),
              Icon(Icons.music_video),
            ],
          ),
        ),
      ),
    );
  }
}