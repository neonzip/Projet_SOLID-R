import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Projects/ProjectDetailedAdmin.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/OneProject/SeeMoreButton.dart';

import '../../../user/view/Project/OneProject/ProjectProgressBar.dart';

class ProjectViewAdmin extends StatefulWidget {
  final ProjectModel project;
  final double contribution;

  const ProjectViewAdmin({Key? key, required this.project, required this.contribution}) : super(key: key);

  @override
  _ProjectViewAdminState createState() => _ProjectViewAdminState();
}

/// Class of one instance of project.
class _ProjectViewAdminState extends State<ProjectViewAdmin>{
  double valueDonation = 0.0;

  /// Widget for one card which is containing the information about a project.
  Widget projectTemplate() {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 10.0, top: 10),
          child: contentCard(),
        ),
        Container(
          margin: const EdgeInsets.only(bottom:20),
          alignment: FractionalOffset.topLeft,
          child: const Image(
            image: AssetImage("assets/logo_solid_R.png"),
            height: 40.0,
            width: 40.0,
          ),
        ),
      ],
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

  Widget contentCard() {
    double progressGoal = double.parse(((widget.project.projectResult * 100) / widget.project.projectDonationGoal).toStringAsFixed(2));

    return Card(
      color: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Table(
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
            ),

            /* Displays the progress bar */
            SizedBox(
                width: 300,
                child: Column(
                  children: [
                    ProjectProgressBar(
                      valueBar: progressGoal / 100, // %
                    ),

                    Container (
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                          children: [
                            Text("$progressGoal % financés"),
                          ]
                      ),
                    )
                  ],
                )
            ),

            /* Displays the introduction's project */
            SizedBox(
                child: Text(
                  widget.project.projectDescription,
                  textAlign: TextAlign.justify,
                )
            ),

            /* Line with the two buttons */
            Row(
              children: [
                const Spacer(
                  flex: 10,
                ),

                /* Button "Voir plus" */
                SeeMoreButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ProjectDetailedAdmin(project: widget.project,)));
                  },
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}