import 'package:flutter/material.dart';

/// Widget building the projects button.
/// It redirects to the page where the user can see all the solidarity project that the association wants to show.
class HomeButtonAllProjects extends StatelessWidget {
  const HomeButtonAllProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "projects",
      onPressed: () {
        Navigator.pushNamed(context, "/user/projects/section=solidarity");
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