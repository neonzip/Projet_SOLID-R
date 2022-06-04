import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import 'HomeLoadingLogos.dart';

/// Building a grid with the logos of associations.
class HomeSponsors extends StatelessWidget {
  final UserModel user;
  final BuildContext context;
  const HomeSponsors({Key? key, required this.context, required this.user,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10), //border corner radius
      ),
      margin: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
      height: MediaQuery.of(context).size.height / 3,
      child: HomeLoadingLogos(context: context, user: user,),
    );
    }

}