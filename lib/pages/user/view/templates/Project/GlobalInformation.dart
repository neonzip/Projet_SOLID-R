import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

import 'FavoriteButton.dart';
import '../DonationButton.dart';

class GlobalInformation extends StatefulWidget {
  final void Function()? onPressed;
  final DateTime goalDate;
  final ProjectModel project;

  const GlobalInformation({Key? key, required this.goalDate, this.onPressed, required this.project}) : super(key: key);
  @override
  _GlobalInformationState createState() => _GlobalInformationState();
}

class _GlobalInformationState extends State<GlobalInformation> {
  @override
  Widget build(BuildContext context) {
    return globalInformationTemplate();
  }

  /// Widget which contains the two containers about the user's participation and the association that proposed the project, ...
  /// This represents the first part before the blue line.
  Widget globalInformationTemplate() {
    DateTime date = widget.goalDate;

    return Container(
      margin: const EdgeInsets.all(5),
      child: Table(
          children: [
            TableRow(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: const [
                          AutoSizeText(
                            "Projet au nom Projet au nom Projet au nom Projet au nom ",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ],
                      )
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    alignment: Alignment.topRight,
                    child: Text(
                      "Objectif atteint le $date",
                      textAlign: TextAlign.end,
                    ),
                  )
                ]
            ),
            TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child: const Text("Association qui propose"),
                  ),
                  Text(widget.project.projectAssociation.entityName, textAlign: TextAlign.right,),
                ]
            ),
            TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child:
                    FavoriteButton(
                      isFav: widget.project.projectIsFavorite,    // Value to change in function of the project we use
                    ),
                  ),
                  (widget.project.projectResult < 100)?
                  DonationButton(
                    idProject: 0,
                    onPressedButton: widget.onPressed,//showDonationDialog,
                    text: 'Donner',
                  ): const Text(""),
                ]
            ),
          ]
      ),
    );
  }
}