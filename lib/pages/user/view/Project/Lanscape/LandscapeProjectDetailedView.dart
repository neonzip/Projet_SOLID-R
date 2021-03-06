import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:marquee/marquee.dart';
import 'package:projet_solid_r/pages/user/view/Project/OneProject/DetailedView/MeceneInformation.dart';
import '../../../../DAO/DonationDAO.dart';
import '../../../../DAO/ProjectDAO.dart';
import '../../../../DAO/UserDAO.dart';
import '../../../../MODEL/DonationModel.dart';
import '../../../../MODEL/ProjectModel.dart';
import '../../../../MODEL/UserModel.dart';
import '../AboutDonation/DonationButton.dart';
import '../OneProject/GlobalInformation.dart';
import '../OneProject/ProjectProgressBar.dart';
import '../../templates/Separator.dart';
import '../AboutDonation/ShareButton.dart';
import '../AboutDonation/VideoAdvertisement.dart';

class LandscapeProjectDetailedView extends StatefulWidget {
 // Project projectToSee;
  final ProjectModel project;
  final UserModel user;
  const LandscapeProjectDetailedView({Key? key, required this.project, required this.user}) : super(key: key);

  @override
  _LandscapeProjectDetailedViewState createState() => _LandscapeProjectDetailedViewState();
}

/// Widget which only contains the participation part that you can see in the first container of the detailed project page.
class _LandscapeProjectDetailedViewState extends State<LandscapeProjectDetailedView> {
  double valueDonation = 0.0;

  Widget participationInformationTemplate() {
    double progressGoal = double.parse(((widget.project.projectResult * 100) / widget.project.projectDonationGoal).toStringAsFixed(2));
    int numberOfDays = widget.project.projectEndDate.difference(widget.project.projectStartDate).inDays;

    return Container (
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Column(
        children: [
          const AutoSizeText("Ma participation :",),
          const AutoSizeText("80 ???",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
            ProjectProgressBar(
                valueBar: progressGoal / 100, // %
            ),
          Visibility(
            visible: (widget.project.projectDonationGoal == widget.project.projectResult),
            child: AutoSizeText(
                "Cagnotte remplie en $numberOfDays jours",
                textAlign: TextAlign.center,
                maxLines: 2
            ),
          ),
          Visibility(
              visible: (widget.project.projectDonationGoal != widget.project.projectResult),
              child: Container (
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Column(
                    children: [
                      Text("$progressGoal % financ??s"),
                    ]
                ),
              ))
        ],
      ),
    );
  }

  Widget projectDetailedNavigation() {
    return
      DefaultTabController(
        length: (widget.project.projectResult == widget.project.projectDonationGoal)? 4 : 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 0,
            bottom : TabBar(
              labelStyle:const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              labelColor: Colors.white,
              indicator: BoxDecoration(
                color: const Color(0xFF0725A5),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(
                  child: Marquee(
                    showFadingOnlyWhenScrolling: true,
                    fadingEdgeStartFraction: 0.1,
                    fadingEdgeEndFraction: 0.5,
                    text: 'Projet',
                    blankSpace: 50.0,
                    pauseAfterRound: const Duration(seconds: 4),
                    accelerationDuration: const Duration(seconds: 2),
                    decelerationDuration: const Duration(milliseconds: 500),
                  ),
                ),
                Tab(
                    child: Marquee(
                      showFadingOnlyWhenScrolling: true,
                      fadingEdgeStartFraction: 0.1,
                      fadingEdgeEndFraction: 0.5,
                      text: 'Association',
                      blankSpace: 50.0,
                      pauseAfterRound: const Duration(seconds: 4),
                      accelerationDuration: const Duration(seconds: 2),
                      decelerationDuration: const Duration(milliseconds: 500),
                    )
                ),
                Tab(
                    child: Marquee(
                      showFadingOnlyWhenScrolling: true,
                      fadingEdgeStartFraction: 0.1,
                      fadingEdgeEndFraction: 0.5,
                      text: 'M??c??ne',
                      blankSpace: 50.0,
                      pauseAfterRound: const Duration(seconds: 4),
                      accelerationDuration: const Duration(seconds: 2),
                      decelerationDuration: const Duration(milliseconds: 500),
                    )
                ),
                if (widget.project.projectResult == widget.project.projectDonationGoal)
                  Tab(
                      child: Marquee(
                        showFadingOnlyWhenScrolling: true,
                        fadingEdgeStartFraction: 0.1,
                        fadingEdgeEndFraction: 0.5,
                        text: 'R??sultats',
                        blankSpace: 50.0,
                        pauseAfterRound: const Duration(seconds: 4),
                        accelerationDuration: const Duration(seconds: 2),
                        decelerationDuration: const Duration(milliseconds: 500),
                      )
                  ),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: AutoSizeText(widget.project.projectDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: AutoSizeText(widget.project.projectAssociation.entityDescription,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ),
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: AutoSizeText(widget.project.projectEntity.entityDescription,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ),
                if (widget.project.projectResult == widget.project.projectDonationGoal)
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: AutoSizeText(widget.project.projectResultDescription,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ),
              ]
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC1D4FF),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Container(
              padding: const EdgeInsets.all(5),
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    GlobalInformation(
                      user: widget.user,
                      project: widget.project,
                      goalDate: DateTime.now(),
                      onPressed: showDonationInputDialog,
                    ),
                    //globalInformationTemplate(),
                    participationInformationTemplate(),
                    MeceneInformation(project: widget.project),

                    /* Blue horizontal line separating the two parts of the main page. */
                    const Separator(),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      padding: const EdgeInsets.all(5),
                      child: projectDetailedNavigation(),
                    )
                  ],
                )
            )
        ),
      )
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
                    setState(() {
                    });
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
                  onPressedButton: () {
                    DonationModel donation = DonationModel("-1", DateTime.now(), valueDonation, "1", widget.project.projectID);

                    DonationDAO().addDonation(donation);
                    widget.project.projectResult += valueDonation;
                    ProjectDAO().setDonationState(widget.project);

                    UserDAO().setPurseUser(widget.user, widget.user.userPurse - donation.sumOfDonation);
                    UserDAO().addOneDonationUser(widget.user);

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
}



