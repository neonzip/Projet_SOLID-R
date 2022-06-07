import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import 'HomeButtonAllProjects.dart';
import 'HomeButtonFavoriteProjects.dart';

/// Bottom app bar with the 3 buttons for the user home.
class HomeBottomAppBar extends StatelessWidget {
  final UserModel user;
  const HomeBottomAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 20,
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child:
              /* Favorites button. */
              HomeButtonFavoriteProjects(user: user,),
            ),


            SizedBox(
              height: 100,
              width: 100,
              child:
              /* Projects button. */
              HomeButtonAllProjects(user: user,),
            ),
          ],
        )
    );
  }
}