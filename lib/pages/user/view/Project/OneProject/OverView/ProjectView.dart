import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/DAO/DonationDAO.dart';
import 'package:projet_solid_r/pages/MODEL/DonationModel.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/Portrait/PortraitProjectDetailedView.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/OneProject/SeeMoreButton.dart';
import 'package:projet_solid_r/pages/user/view/Project/AboutDonation/VideoAdvertisement.dart';
import '../../../../../DAO/ProjectDAO.dart';
import '../../../../../DAO/UserDAO.dart';
import '../../AboutDonation/DonationButton.dart';
import '../FavoriteButton.dart';
import '../ProjectProgressBar.dart';
import '../../AboutDonation/ShareButton.dart';

class ProjectView extends StatefulWidget {
  final UserModel? user;
  final ProjectModel project;
  final double contribution;

  const ProjectView({Key? key, required this.project, required this.contribution, this.user}) : super(key: key);

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
                              user: widget.user!,
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
                            Text("$progressGoal % financ??s"),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> PortraitProjectDetailedView(project: widget.project, user: widget.user!,))).then((result) => setState(() {}));
                    },
                ),
                const Spacer(),
                /* Button "Donner" is displayed if it is not finished, then nothing. */
                (widget.project.projectResult < widget.project.projectDonationGoal)?
                DonationButton(
                  onPressedButton: showDonationInputDialog,
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
              "Don r??alis?? !",
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
                    "F??licitation, vous avez donn?? " + valueDonation.toString() + " ??? au projet ! "
                        "\n\nContinuez d'enregistrer vos activit??s sportives pour soutenir d'autres projets.",
                  ),
                ),
                DonationButton(
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

  /// Display the dialog where the user can set the amount of the donation.
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
                  onPressedButton: () {
                    DonationModel donation = DonationModel("-1", DateTime.now(), valueDonation, "1", widget.project.projectID);

                    DonationDAO().addDonation(donation);
                    widget.project.projectResult += valueDonation;

                    /// If the project is totally financed, we add to it the date of the last donation.
                    if (widget.project.projectResult == widget.project.projectDonationGoal) {
                      widget.project.projectEndDate = DateTime.now();
                    }

                    ProjectDAO().setDonationState(widget.project);

                    UserDAO().setPurseUser(widget.user!, widget.user!.userPurse - donation.sumOfDonation);
                    UserDAO().addOneDonationUser(widget.user!);

                    // TODO : We have to make sure that the input is correct. If it is not, display a message for the user.

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