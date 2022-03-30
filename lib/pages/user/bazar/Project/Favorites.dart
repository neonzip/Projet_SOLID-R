import 'package:flutter/material.dart';

import '../../controller/fakeDataTest/DataProjectTest.dart';
import '../../view/Project/ProjectsView.dart';
import '../../view/templates/Separator.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Projets favoris"),
        centerTitle: true,
      ),
        /* Here is called our button to go back at the top of the page. */
        floatingActionButton: _showBackToTopButton == false ? null: buttonTopPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
        body: Center(
    child: ProjectsView(
    filter: filterTemplate(),
    isExpandedFilter: true,
    controller: _scrollController,
    listProjects: DataProjectTest().getListSolidarityProjectsViews(),
    ),     // Displays the specific projects of the chosen section on the screen
    )
    );
  }
  bool? filterAll = false;
  bool? filterFavorite = false;
  bool isExpanded = false;

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
            SizedBox(
              height: 35,
              child: CheckboxListTile(
                side: const BorderSide(color: Color(0xFF0725A5)),
                activeColor: const Color(0xFF0725A5),
                checkColor: Colors.yellow,
                title: const Text('Tous', style: TextStyle(color: Color(0xFF0725A5))),
                value: filterAll,
                onChanged: (value) {
                  setState(() {
                    filterAll = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 35,
              child: CheckboxListTile(
                side: const BorderSide(color: Color(0xFF0725A5)),
                activeColor: const Color(0xFF0725A5),
                checkColor: Colors.yellow,
                title: const Text('Favoris', style: TextStyle(color: Color(0xFF0725A5))),
                value: filterFavorite,
                onChanged: (value) {
                  setState(() {
                    filterFavorite = value;
                  });
                },
              ),
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
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  /// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  }