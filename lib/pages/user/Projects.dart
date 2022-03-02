import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'Project.dart';

const int statusAllFormal = 0;
const int statusAllSolidarity = 1;
const int statusFavoriteSolidarity = 2;
const int statusRunningFormal = 3;
const int statusFinishedFormal = 4;

class Projects {
  ///https://stackoverflow.com/questions/60799348/activate-and-deactivate-favorite-icons-in-flutter
  late BuildContext context;
  late ScrollController _scrollController;  // Scroll controler that we will use
  late Widget filterToUse;
  late int nbProjects; // To change with the list after


  /// Constructor called in the files where we need it.
  Projects(BuildContext contextB, Widget filterToUseB, ScrollController controller, int nbProj) {
    context = contextB;
    filterToUse = filterToUseB;
    nbProjects = nbProj;
    _scrollController = controller;
  }

  /// Widget which creates a card with the information of one project.
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
                title: listFormalProjects().elementAt(index).projectTemplate(),
              ),
              childCount: listFormalProjects().length,
            ),
          )
        ]
       );
  }

  /*Widget createProject() {
    Project project = Project(1, true, context, "NameProject1", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association.");
    return project.projectTemplate();
  }*/



  //////////////////////////////////

  /// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /// https://www.kindacode.com/article/flutter-make-a-scroll-back-to-top-button/
  /// Several parts about the button which drives us to the top of the page are in this section.

  /// Button to return to the top of the page in order to access to the filter directly.
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

  /* This function is triggered when the user presses the back-to-top button.
   * The scroll controller does its action. During 3 seconds, the screen is scrolling itself until the top of the page is reached.
   */
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  BuildContext getContext() {
    return context;
  }

  List<Project> listFormalProjects() {
    Project project1 = Project(1, true, context, "NameProject1", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association1.");
    Project project2 = Project(2, true, context, "NameProject2", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association2.");
    Project project3 = Project(3, false, context, "NameProject3", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association3.");
    Project project4 = Project(4, true, context, "NameProject4", "assets/logo_solid_R.png", "Ceci est un text pour décrire le but de l'association4.");
    List<Project> listProjectsFormal = <Project>[project1, project2, project3, project4];
    return listProjectsFormal;
  }
/// ///////////////////////////////////////////////////////////

}