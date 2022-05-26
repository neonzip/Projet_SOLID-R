import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class LandscapeProjectView extends StatefulWidget {
  final ProjectModel project;
  final double contribution;

  const LandscapeProjectView({Key? key, required this.project, required this.contribution}) : super(key: key);

  @override
  _LandscapeProjectViewState createState() => _LandscapeProjectViewState();
}

/// Class of one instance of project.
class _LandscapeProjectViewState extends State<LandscapeProjectView>{
  double valueDonation = 0.0;

  /// Widget for one card which is containing the information about a project.
  Widget projectTemplate(){
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                children: [
                  AutoSizeText(
                    widget.project.projectName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  Image.asset(widget.project.getProjectAssociation().associationLogo, height: 60, width: 60,),
                  //buttonFavorite(),
                ]
            ),
          ],
        )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return projectTemplate();
  }

  @override
  void initState() {
    super.initState();
  }
}