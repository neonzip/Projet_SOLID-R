import 'package:flutter/material.dart';

/// Floating action button "Activités".
/// When the user clicks on it, he is automatically redirected to the activity page.
class HomeButtonActivity extends StatelessWidget {
  const HomeButtonActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }