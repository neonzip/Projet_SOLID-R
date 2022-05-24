import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/AddingProject/ProjectsViewAdmin.dart';

import '../../../user/controller/fakeDataTest/DataProjectTest.dart';
import '../../../user/view/templates/ItemFilter.dart';
import '../../../user/view/templates/Separator.dart';
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

  List<ProjectViewAdmin>? listProjects = <ProjectViewAdmin>[];

  /// Widget for filter.
  Widget filterTemplate() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      color: Colors.white,
      child: Column (
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemFilter(
              isSelected: filterAll,
              textItem: 'Tous',
              onChanged: (value) {
                setState(() {
                  filterAll = value;
                  if (filterAll == true) {
                    filterRunning = false;
                    filterFinished = false;
                    listProjects = DataProjectTest().getListFormalProjectsViews().cast<ProjectViewAdmin>();
                  }
                });
              }
          ),
          ItemFilter(
              isSelected: filterRunning,
              textItem: 'En cours',
              onChanged: (value) {
                setState(() {
                  filterRunning = value;
                  if (filterRunning == true) {
                    filterFinished = false;
                    filterAll = false;
                    listProjects = DataProjectTest().getListRunningFormalProjectsViews().cast<ProjectViewAdmin>();
                  }
                  else {
                  }
                });
              }
          ),
          ItemFilter(
              isSelected: filterFinished,
              textItem: 'Terminés',
              onChanged: (value) {
                setState(() {
                  filterFinished = value;
                  if (filterFinished == true) {
                    filterAll = false;
                    filterRunning = false;
                    listProjects = DataProjectTest().getListFinishedFormalProjectsViews().cast<ProjectViewAdmin>();
                  }
                });
              }
          ),
        ],
      ),
    );
  }
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
    return Center(
          child: ProjectsViewAdmin(
            filter: filterTemplate(),
            isExpandedFilter: isExpanded,
            controller: _scrollController,
            listProjects: listProjects,
          ),
    );
  }
}
