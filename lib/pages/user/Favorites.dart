import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomDropdownButton.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  bool isFavorite = false;
  // List in the dropdown list
  final items = ['A', 'B', 'C'];
  late String _myActivity;
  late String _myActivityResult;

  // future selected value in the dropdown list
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
        child: Text(
            item,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Projets favoris"),
        centerTitle: true,
      ),
      body: Center(
          child: buttonFavorite()
      ),
    );
  }

  Widget buttonFavorite() {
    return IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          // Setting the state
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }

  void setStateFavorite() {
    isFavorite = !isFavorite;
    log("isFav ? ", error: isFavorite);
  }

}