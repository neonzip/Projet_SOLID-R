import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/Projects.dart';

const int statusAllFormal = 0;

class FormalProjects extends StatefulWidget {
  const FormalProjects({Key? key}) : super(key: key);

  @override
  _FormalProjectsState createState() => _FormalProjectsState();
}

class _FormalProjectsState extends State<FormalProjects> {
  bool? filterAll = false;
  bool? filterRunning = false;
  bool? filterFinished = false;

  /// Widget for filter.
  Widget filterTemplate() {
    return Column (
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Row(
              children: const [
                Text("Filtrer"),
                Icon(Icons.arrow_drop_down),
              ],
            )
        ),

        CheckboxListTile(
          title: const Text('Tous'),
          value: filterAll,
          onChanged: (value) {
            setState(() {
              filterAll = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('En cours'),
          value: filterRunning,
          onChanged: (value) {
            setState(() {
              filterRunning = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Terminés'),
          value: filterFinished,
          onChanged: (value) {
            setState(() {
              filterFinished = value;
            });
          },
        ),
      ],
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

  late ScrollController _scrollController;  // Scroll controler that we will use

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

  /* This function is triggered when the user presses the back-to-top button.
   * The scroll controller does its action. During 3 seconds, the screen is scrolling itself until the top of the page is reached.
   */
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  /// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /// Builder for the page of projects in the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Projets soutenus"),
          centerTitle: true,
        ),
      /* Here is called our button to go back at the top of the page. */
        floatingActionButton: _showBackToTopButton == false ? null: buttonTopPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      body: Center(
        child: addListProjects(),         // Displays the specific projects of the chosen section on the screen
      )

    );
  }

  /* Widget which displays the specific projects of the chosen section on the screen. */
  Widget addListProjects() {
    Projects projects = Projects(statusAllFormal, context, filterTemplate(), _scrollController, 10);
    return projects.templateProjects();
  }
}