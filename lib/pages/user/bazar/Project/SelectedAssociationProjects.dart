import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/controller/fakeDataTest/DataProjectTest.dart';

import '../../view/Project/ProjectView.dart';
import '../../view/templates/ItemFilter.dart';
import '../../view/templates/Separator.dart';
import '../../view/Project/ProjectsView.dart';

class SelectedAssociationProjects extends StatefulWidget {
  final int associationID;
  const SelectedAssociationProjects({Key? key, required this.associationID}) : super(key: key);

  @override
  _SelectedAssociationProjectsState createState() => _SelectedAssociationProjectsState();
}

class _SelectedAssociationProjectsState extends State<SelectedAssociationProjects> {
  bool? filterAll = false;
  bool? filterAssociationProjects = true;
  bool isExpanded = false;

  List<ProjectView> listProjects = <ProjectView>[];

  /// Widget for filter.
  Widget filterTemplate() {
    return SizedBox(
        height: 190,
        child: Column (
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                child: Row(
                  children: [
                    const Text("Filtrer", style: TextStyle(color: Color(0xFF0725A5))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(isExpanded? Icons.arrow_drop_up : Icons.arrow_drop_down, color: const Color(0xFF0725A5),)
                    )],
                )
            ),

            const SizedBox(
              height: 15,
              child: Separator(),
            ),
            ItemFilter(
                isSelected: filterAssociationProjects,
                textItem: 'Ceux de l\'association',
                onChanged: (value) {
                  setState(() {
                    filterAssociationProjects = value;
                    filterAll = false;
                    if (filterAssociationProjects == true) {
                      listProjects = DataProjectTest().getListSolidarityProjectsOfAssociationViews(widget.associationID);
                    }
                    else{
                      if (filterAll == false) {
                        filterAssociationProjects = true;
                      }
                    }
                  });
                }
            ),
            ItemFilter(
                isSelected: filterAll,
                textItem: 'Tous',
                onChanged: (value) {
                  setState(() {
                    filterAll = value;
                    if (filterAll == true) {
                      filterAssociationProjects = false;
                      listProjects = DataProjectTest().getListSolidarityProjectsViews();
                    }
                    else {
                      filterAssociationProjects = true;
                      listProjects = DataProjectTest().getListSolidarityProjectsOfAssociationViews(widget.associationID);
                    }
                  });
                }
            ),
          ],
        )
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
    listProjects = DataProjectTest().getListSolidarityProjectsOfAssociationViews(widget.associationID);
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Projets solidaires"),
          centerTitle: true,
        ),
        /* Here is called our button to go back at the top of the page. */
        floatingActionButton: _showBackToTopButton == false ? null: buttonTopPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
        backgroundColor: const Color(0xFFD7E1FF),
        body: Center(
          child: ProjectsView(
            nbItemFilter: 2, // TODO:CHANGE this
            filter: filterTemplate(),
            controller: _scrollController,
            listProjects: listProjects,
          ),     // Displays the specific projects of the chosen section on the screen
        )
    );
  }
}
