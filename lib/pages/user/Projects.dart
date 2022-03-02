import 'package:flutter/material.dart';

import 'Project.dart';

/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// Constants for every possible status to list the Projects (easier and communicates with the filters.
/// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const int statusAllFormal = 0;            // To get the list of all formal projects
const int statusAllSolidarity = 1;        // To get the list of all solidarity projects
const int statusFavoriteSolidarity = 2;   // To get the list of the favorite solidarity projects
const int statusRunningFormal = 3;        // To get the list of running(not finished) formal projects
const int statusFinishedFormal = 4;       // To get the list of finished formal projects

///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter

/// Class which contains the list of Projects and displays them in the application.
class Projects {
  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Attributes that we need to build each Project and to displays the widget.
  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  late BuildContext context;
  late ScrollController _scrollController;  // Scroll controler that we will use
  late Widget filterToUse;
  late int nbProjects; // To change with the list after
  late int statusSection;


  /// Constructor called in the files where we need it.
  Projects(int section, BuildContext contextB, Widget filterToUseB, ScrollController controller, int nbProj) {
    context = contextB;
    statusSection = section;
    filterToUse = filterToUseB;
    nbProjects = nbProj;
    _scrollController = controller;
  }

  /// Widget which creates the cards with the information of each Project.
  Widget templateProjects() {
    return
       CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            floating:false,
            automaticallyImplyLeading: false,
            elevation: 2,
            pinned: true,
            expandedHeight: 210,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
             flexibleSpace:
                /* Adding filter to the app. */
                SingleChildScrollView(
                child: filterToUse,
                )
          ),

          /* Adding Cards to the app. To change with real function : Creation of many projects. */
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                title: listProjects()?.elementAt(index).projectTemplate(),
              ),
              childCount: listProjects()?.length,
            ),
          )
        ]
       );
  }

  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// https://www.kindacode.com/article/flutter-make-a-scroll-back-to-top-button/
  /// Several parts about the button which drives us to the top of the page are in this section.
  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /* Button to return to the top of the page in order to access to the filter directly. */
  Widget buttonTopPage() {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton.extended(
        onPressed: _scrollToTop,
        //Navigator.pushNamed(context, "/projects/section=formal");
        isExtended: false,
        extendedPadding: const EdgeInsets.all(10),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: const Icon(Icons.arrow_upward, size: 30, color: Color(0xB9FFFFFF)),
        splashColor: Colors.yellow,
        backgroundColor: const Color(0xD50725AB),
        label: const Text(''),
      ),
    );
  }

  /*
   * This function is triggered when the user presses the back-to-top button.
   * The scroll controller does its action. During 3 seconds, the screen is scrolling itself until the top of the page is reached.
   */
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// Lists of Project we need to have and a global function which choses the good list about a specific section and order.
  /// To do with the database.
  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /* Take the good list, for a section. */
  List<Project>? listProjects() {
    switch (statusSection) {
      case statusAllFormal:
        return listFormalProjects();
      case statusAllSolidarity:
        return listSolidarityProjects();
      default:
        return null;
    }
  }

  /* Creates and returns the list of all formal projects. */
  List<Project> listFormalProjects() {
    Project project1 = Project(1, true, context, "NameProject1", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association1.");
    Project project2 = Project(2, true, context, "NameProject2", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association2.");
    Project project3 = Project(3, false, context, "NameProject3", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association3.");
    Project project4 = Project(4, true, context, "NameProject4", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association4.");
    List<Project> listProjectsFormal = <Project>[project1, project2, project3, project4];
    return listProjectsFormal;
  }

  /* Creates and returns the list of all solidarity projects. */
  List<Project> listSolidarityProjects() {
    Project project1 = Project(5, false, context, "NameProject11", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association1.");
    Project project2 = Project(6, true, context, "NameProject22", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association2.");
    Project project3 = Project(7, false, context, "NameProject33", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association3.");
    Project project4 = Project(8, true, context, "NameProject44", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association4.");
    List<Project> listProjectsFormal = <Project>[project1, project2, project3, project4];
    return listProjectsFormal;
  }
/// ///////////////////////////////////////////////////////////

}