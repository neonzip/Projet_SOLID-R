import 'package:flutter/material.dart';

import 'HomeBuildingLogo.dart';

/// Load the different image logos and displays them.
class HomeLoadingLogos extends StatelessWidget {
  final BuildContext context;

  const HomeLoadingLogos({Key? key, required this.context,}) : super(key: key);


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
            assocationId: 3,
            context: context
        ),
        HomeBuildingLogo(
            imagePath: "assets/LogoAssociation/logo2.jpg",
            assocationId: 2,
            context: context
        ),
        HomeBuildingLogo(
            imagePath: "assets/LogoAssociation/logo1.jpg",
            assocationId: 1,
            context: context
        ),
      ],
    );
  }
}