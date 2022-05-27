import 'package:flutter/material.dart';

/// Displays the logo and add to it a gesture in order to have an hyperlink to go in the A propos page by clicking it.
class HomeLogoAppBar extends StatelessWidget {
  const HomeLogoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/user/APropos");
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/logo_solid_R.png"),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFF0725A5),
          ),
        ),
      );
    }
  }