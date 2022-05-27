import 'package:flutter/material.dart';

import 'HomeUserName.dart';
import 'YellowBubbleKilometers.dart';
import 'YellowBubbleMoney.dart';

/// Widget displaying the user name.
class HomeUserInformation extends StatelessWidget {
  final String name;
  final String purse;
  final String distance;

  const HomeUserInformation({Key? key, required this.name, required this.purse, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeUserName(name: name),

        /// Yellow bubble containing the money that the user can make to a project.
        YellowBubbleMoney(
          value: purse,
        ),

        /// Yellow bubble containing the kilometers traveled.
        YellowBubbleKilometers(
          valueKilometers: distance,
        ),
      ],
    );
    }
  }