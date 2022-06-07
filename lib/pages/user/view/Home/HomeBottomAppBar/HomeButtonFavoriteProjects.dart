import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import '../../Project/SomeProjects/SolidarityProjects/Favorites.dart';

/// Widget building the favorites button.
/// This button redirects to the page which displays all the favorite projects of the user.
class HomeButtonFavoriteProjects extends StatelessWidget {
  final UserModel user;
  const HomeButtonFavoriteProjects({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "favorites",
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Favorites(user: user)));
      },
      tooltip: 'Favoris',
      splashColor: Colors.indigo,
      backgroundColor: Colors.transparent,
      focusElevation: 0,
      hoverElevation: 0,
      hoverColor: Colors.yellow,
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
}