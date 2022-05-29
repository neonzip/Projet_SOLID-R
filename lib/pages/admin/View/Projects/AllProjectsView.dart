import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/ProjectsViewAdmin.dart';

import '../../../user/controller/fakeDataTest/DataProjectTest.dart';
import 'ProjectViewAdmin.dart';

class AllProjectsView extends StatefulWidget {
  const AllProjectsView({Key? key,}) : super(key: key);

  @override
  _AllProjectsViewState createState() => _AllProjectsViewState();
}

class _AllProjectsViewState extends State<AllProjectsView> {
  bool? filterAll = true;
  bool? filterRunning = false;
  bool? filterFinished = false;
  bool isExpanded = false;

  int selectedFilter = 1; // 1 for All, 2 for running and 3 for finished in this case

  List<ProjectViewAdmin>? listProjects = <ProjectViewAdmin>[];

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

  bool _showBackToTopButton = false;        // false to hide the button, true to show it

  late ScrollController _scrollController;  // Scroll controller that we will use

  /// Shows or not the button. It depends on where we are in the page.
  @override
  void initState() {
    listProjects = DataProjectTest().getListAllProjectsViewsAdmin().cast<ProjectViewAdmin>();
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          /* Before 400, the button does not appear because the user can scrolls itself without difficulty to return to the filter.
           * After 400, the button is shown and the user can click in it if he wants to go back to the filter or to the top of the page.
           */
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  /*
   * This function is triggered when the user presses the back-to-top button.
   * The scroll controller does its action. During 3 seconds, the screen is scrolling itself until the top of the page is reached.
   */
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 50), curve: Curves.linear);
  }

  /// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// Builder for the page of projects in the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProjectsViewAdmin(
          isExpandedFilter: isExpanded,
          controller: _scrollController,
          listProjects: listProjects,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
              tooltip: "Filtrer les projets",
              padding: const EdgeInsets.all(0),
              child: Row(
                children: const [
                  Text("Filtrer", style: TextStyle(color: Color(0xFF0725A5)),),
                  Icon(Icons.arrow_drop_down, color: Color(0xFF0725A5)),
                ],
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    selectedFilter = 1;
                    setState(() {
                      listProjects = DataProjectTest().getListFormalProjectsViewsAdmin();
                    });
                  },
                  child: Text('Tous', style: TextStyle(color: const Color(0xFF0725A5), fontWeight: (selectedFilter == 1)? FontWeight.bold : FontWeight.normal),),
                ),
                PopupMenuItem(
                  onTap: () {
                    selectedFilter = 2;
                    setState(() {
                      listProjects = DataProjectTest().getListRunningFormalProjectsViewsAdmin().cast<ProjectViewAdmin>();
                    });
                  },
                  child:  Text('En cours', style: TextStyle(color: const Color(0xFF0725A5), fontWeight: (selectedFilter == 2)? FontWeight.bold : FontWeight.normal),),
                ),
                PopupMenuItem(
                  onTap: () {
                    selectedFilter = 3;
                    setState(() {
                      listProjects = DataProjectTest().getListFinishedFormalProjectsViewsAdmin().cast<ProjectViewAdmin>();
                    });
                  },
                  child:  Text('Terminés', style: TextStyle(color: const Color(0xFF0725A5), fontWeight: (selectedFilter == 3)? FontWeight.bold : FontWeight.normal),),
                ),
              ]
          )
        ],
      ),
    );

  }
}
