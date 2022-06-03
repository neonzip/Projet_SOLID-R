import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/dao/ProjectDAO.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class FavoriteButton extends StatefulWidget {
  ProjectModel project;

//  static int idProject;
  FavoriteButton({Key? key, required this.project}) : super(key: key);
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
        icon: Icon(widget.project.projectIsFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          // Setting the state
          setState(() {
            widget.project.projectIsFavorite = !widget.project.projectIsFavorite;
            ProjectDAO().setFavoriteState(widget.project);
          });
        });
  }
  ///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter
}