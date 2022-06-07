import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Activity/ChoosingActivity/Activities.dart';

import '../../model/UserModel.dart';

/// Floating action button "Activités".
/// When the user clicks on it, he is automatically redirected to the activity page.
class HomeButtonActivity extends StatelessWidget {
  final UserModel user;
  const HomeButtonActivity({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
    ),
          padding: const EdgeInsets.all(2),
          child: FloatingActionButton(
              heroTag: "activity",
              onPressed: () {
                // Navigator.pushNamed(context, "/user/activities");
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Activities(user: user)));
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