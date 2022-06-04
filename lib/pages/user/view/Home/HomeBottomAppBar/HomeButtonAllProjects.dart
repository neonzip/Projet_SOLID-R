import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/SomeProjects/SolidarityProjects/SolidarityProjects.dart';

/// Widget building the projects button.
/// It redirects to the page where the user can see all the solidarity project that the association wants to show.
class HomeButtonAllProjects extends StatelessWidget {
  final UserModel user;
  const HomeButtonAllProjects({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "projects",
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SolidarityProjects(user: user)));
      },
      tooltip: 'Projets',
      splashColor: Colors.indigo,
      backgroundColor: MediaQuery
          .of(context)
          .orientation == Orientation.landscape ? Colors.white : Colors
          .transparent,
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
            visible: MediaQuery
                .of(context)
                .orientation == Orientation.portrait,
            child: const Text(
              "Projets",
              style: TextStyle(color: Colors.black),
            ),
          )

        ],
      ),
    );
  }
}