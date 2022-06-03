import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/dao/DonationDAO.dart';
import 'package:projet_solid_r/pages/user/model/DonationModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/Portrait/PortraitProjectDetailedView.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/OneProject/SeeMoreButton.dart';
import 'package:projet_solid_r/pages/user/view/Project/AboutDonation/VideoAdvertisement.dart';
import '../../../../dao/ProjectDAO.dart';
import '../../AboutDonation/DonationButton.dart';
import '../FavoriteButton.dart';
import '../ProjectProgressBar.dart';
import '../../AboutDonation/ShareButton.dart';

class ProjectView extends StatefulWidget {
  final ProjectModel project;
  final double contribution;

  const ProjectView({Key? key, required this.project, required this.contribution}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

/// Class of one instance of project.
class _ProjectViewState extends State<ProjectView>{
  double valueDonation = 0.0;

  /// Widget for one card which is containing the information about a project.
  Widget projectTemplate(){
    double contribute = widget.contribution;
    double progressGoal = double.parse(((widget.project.projectResult * 100) / widget.project.projectDonationGoal).toStringAsFixed(2));
    return Card(
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
                          FavoriteButton(
                              project: widget.project,
                          ),
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Column(
                          children: [
                            Text("$progressGoal % financés"),
                            Text("Participation : $contribute %")
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PortraitProjectDetailedView(project: widget.project,)));
                    },
                ),
                const Spacer(),
                /* Button "Donner" is displayed if it is not finished, then nothing. */
                (widget.project.projectResult < widget.project.projectDonationGoal)?
                DonationButton(
                  onPressedButton: showDonationInputDialog,
                  idProject: widget.project.projectID,
                  text: 'Donner',
                ) :const Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Displays the next dialog (after the input for donation) to confirm the donation.
  void showDonationDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "Don réalisé !",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    "Félicitation, vous avez donné " + valueDonation.toString() + " € au projet ! "
                        "\n\nContinuez d'enregistrer vos activités sportives pour soutenir d'autres projets.",
                  ),
                ),
                DonationButton(
                  idProject: widget.project.projectID,
                  onPressedButton: () {
                    Navigator.of(context).pop();

                    /// Send the user to the advertisement
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> VideoAdvertisement(project: widget.project)));
                    },
                  text: 'Confirmer le don',
                ),
                ShareButton(
                  valueDonation: valueDonation,
                  nomProjet: widget.project.projectName,
                ),
              ],
            ),
          )
      ),
    );
  }

  /// Display the dialog where the user can set the amount of the donaition.
  void showDonationInputDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: const Text(
              "Faire un don",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "Montant du don :",
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: TextField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0725A5), width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    onChanged: (value) {
                      valueDonation = double.parse(value);
                    },
                  ),
                ),
                DonationButton(
                  idProject: widget.project.projectID,
                  onPressedButton: () {
                    DonationModel donation = DonationModel("-1", DateTime.now(), valueDonation, 1, widget.project.projectID);

                    DonationDAO().addDonation(donation);
                    widget.project.projectResult += valueDonation;
                    ProjectDAO().setDonationState(widget.project);

                    // TODO : Change the purse of the user who has made the donation.
                    // TODO : Here we have to take the value of valueDonation and sum it in the project's amount
                    // TODO : We also have to make sure that the input is correct. If it is not, display a message for the user.
                    // TODO : You can use the widget.project.whatever to get the selected project and do your things in the DB

                    /// After these things, we can pop the dialog and go to the next one for confirmation
                    Navigator.of(context).pop();

                    /// Send the user to the next dialog about the confirmation of the donation
                    showDonationDialog();
                  },
                  text: 'Donner ce montant',
                ),
              ],
            ),
          )
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