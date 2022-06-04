import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import 'HomeBuildingLogo.dart';

/// Load the different image logos and displays them.
class HomeLoadingLogos extends StatelessWidget {
  final UserModel user;
  final BuildContext context;

  const HomeLoadingLogos({Key? key, required this.context, required this.user,}) : super(key: key);


  /// /////////////////////////////////////////////////////////////
  /// ALL methods to build the gridView with the images/assets ///
  /// /////////////////////////////////////////////////////////////
  /// https://himdeve.com/flutter-tutorials/flutter-tutorials-1-9-gridview-slivergrid-gallery/
  @override
  Widget build(BuildContext context) {
    return GridView(
      primary: false,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10),
      children: [
        // TODO : To change with the images of the DB.
        // TODO : Place the images in the folder written below for example.

        HomeBuildingLogo(
            imagePath: "assets/LogoAssociation/logo4.jpg",
            associationId: "3",
            context: context,
          user: user,
        ),
        HomeBuildingLogo(
          user: user,
            imagePath: "assets/LogoAssociation/logo2.jpg",
            associationId: "2",
            context: context
        ),
        HomeBuildingLogo(
          user: user,
            imagePath: "assets/LogoAssociation/logo1.jpg",
            associationId: "1",
            context: context
        ),
      ],
    );
  }
}