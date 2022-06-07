import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class GlobalInformationAdmin extends StatefulWidget {
  final void Function()? onPressed;
  final DateTime goalDate;
  final ProjectModel project;

  const GlobalInformationAdmin({Key? key, required this.goalDate, this.onPressed, required this.project}) : super(key: key);
  @override
  _GlobalInformationAdminState createState() => _GlobalInformationAdminState();
}

class _GlobalInformationAdminState extends State<GlobalInformationAdmin> {
  @override
  Widget build(BuildContext context) {
    return globalInformationTemplate();
  }

  /// Widget which contains the two containers about the user's participation and the association that proposed the project, ...
  /// This represents the first part before the blue line.
  Widget globalInformationTemplate() {
    int month = widget.project.projectEndDate.month;
    int day = widget.project.projectEndDate.day;
    int year = widget.project.projectEndDate.year;

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
                        children: [
                          AutoSizeText(
                            widget.project.projectName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ],
                      )
                  ),
                  Visibility(
                      visible: (widget.project.projectDonationGoal == widget.project.projectResult),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                        alignment: Alignment.topRight,
                        child: Text(
                          "Objectif atteint le $day/$month/$year",
                          textAlign: TextAlign.end,
                        ),
                      )
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
          ]
      ),
    );
  }
}