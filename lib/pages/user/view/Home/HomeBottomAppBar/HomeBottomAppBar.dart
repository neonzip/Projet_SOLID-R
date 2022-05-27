import 'package:flutter/material.dart';

import 'HomeButtonActivity.dart';
import 'HomeButtonAllProjects.dart';
import 'HomeButtonFavoriteProjects.dart';

/// Bottom app bar with the 3 buttons for the user home.
class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child:
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child:
              /* Favorites button. */
              HomeButtonFavoriteProjects(),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: HomeButtonActivity(),
            ),

            SizedBox(
              height: 100,
              width: 100,
              child:
              /* Projects button. */
              HomeButtonAllProjects(),
            ),
          ],
        )
    );
  }
}