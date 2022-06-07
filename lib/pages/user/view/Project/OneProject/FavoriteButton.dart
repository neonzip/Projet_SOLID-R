import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/DAO/UserDAO.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';

import '../../../../MODEL/UserModel.dart';

class FavoriteButton extends StatefulWidget {
  final ProjectModel project;
  final UserModel user;

//  static int idProject;
  const FavoriteButton({Key? key, required this.project, required this.user}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {

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

            /// If the user make the project favorite, we add it to his favorite projects list in the database.
            /// Else, we remove it.
            if (widget.project.projectIsFavorite) {
              UserDAO().addProjectToUserLikedProjects(widget.user, widget.project);
            }
            else {
              UserDAO().removeProjectToUserLikedProjects(widget.user, widget.project);
            }
           // ProjectDAO().setFavoriteState(widget.project);
          });
        });
  }
  ///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter
}