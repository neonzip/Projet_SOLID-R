import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import 'HomeButtonProfile.dart';
import 'HomeLogoAppBar.dart';

/// Widget for the home app bar
class HomeAppBar extends StatelessWidget {
  final UserModel user;

  const HomeAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HomeLogoAppBar(),
          const Text("Accueil",
            textAlign: TextAlign.center,
          ),
          HomeButtonProfile(user: user),
        ],
      ),
    );
    }
  }