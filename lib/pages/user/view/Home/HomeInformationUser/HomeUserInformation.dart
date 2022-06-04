import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import 'HomeUserName.dart';
import 'YellowBubbleKilometers.dart';
import 'YellowBubbleMoney.dart';

/// Widget displaying the user name.
class HomeUserInformation extends StatelessWidget {
  final UserModel user;

  const HomeUserInformation({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeUserName(name: user.userNickName),

        /// Yellow bubble containing the money that the user can make to a project.
        YellowBubbleMoney(
          user: user,
        ),

        /// Yellow bubble containing the kilometers traveled.
        YellowBubbleKilometers(
          valueKilometers: user.userTotalDistance.toString(),
        ),
      ],
    );
    }
  }