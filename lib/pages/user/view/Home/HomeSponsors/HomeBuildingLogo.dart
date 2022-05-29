import 'package:flutter/material.dart';

import '../../Project/SomeProjects/SolidarityProjects/SelectedAssociationProjects.dart';


/// Load the different image logos and displays them.
class HomeBuildingLogo extends StatelessWidget {
  final BuildContext context;
  final String imagePath;
  final int assocationId;

  const HomeBuildingLogo({Key? key, required this.imagePath, required this.assocationId, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero, // Set this
          padding: EdgeInsets.zero, // and this
          elevation: 0,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),

        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SelectedAssociationProjects(associationID: assocationId)));
        },
      ),
    );
  }
}