import 'dart:developer';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  bool isFav;

//  static int idProject;
  FavoriteButton({Key? key, required this.isFav}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  //bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return buttonFavorite();
  }

  /*
  * Favorite button.
  */
  Widget buttonFavorite() {
    return IconButton(
        icon: Icon(widget.isFav ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          // Setting the state
          setState(() {
            widget.isFav = !widget.isFav;
          });
        });
  }
  ///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter
}