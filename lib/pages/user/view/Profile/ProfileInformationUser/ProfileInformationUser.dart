import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import '../../Home/HomeInformationUser/YellowBubbleMoney.dart';
import 'ProfileDonationsDone.dart';
import 'ProfileUserName.dart';

/// Widget with all the information of the user that we can see on the top of the profile page.
class ProfileInformationUser extends StatelessWidget {
  final UserModel user;
  const ProfileInformationUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileUserName(
          name: user.userNickName,
        ),

        /* Yellow bubble containing the money that the user can make to a project. */
        YellowBubbleMoney(
          user: user,
        ),

        /* Yellow bubble containing the donations that the user has already made. */
        ProfileDonationsDone(
            total: user.userTotalDonations.toString(),
        ),
      ],
    );
  }
}