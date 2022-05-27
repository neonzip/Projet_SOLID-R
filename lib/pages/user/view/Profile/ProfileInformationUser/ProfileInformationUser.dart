import 'package:flutter/material.dart';

import '../../Home/HomeInformationUser/YellowBubbleMoney.dart';
import 'ProfileDonationsDone.dart';
import 'ProfileUserName.dart';

/// Widget with all the information of the user that we can see on the top of the profile page.
class ProfileInformationUser extends StatelessWidget {
  final String name;
  final String purse;
  final String totalDonations;
  const ProfileInformationUser({Key? key, required this.name, required this.purse, required this.totalDonations,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileUserName(
          name: name,
        ),

        /* Yellow bubble containing the money that the user can make to a project. */
        YellowBubbleMoney(
          value: purse,
        ),

        /* Yellow bubble containing the donations that the user has already made. */
        ProfileDonationsDone(
            name: totalDonations,
        ),
      ],
    );
  }
}