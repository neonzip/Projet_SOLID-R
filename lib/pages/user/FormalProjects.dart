import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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

  /// Button to see more details about a specific project.
  /// Called "Voir plus".
  Widget buttonSeeMore() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:
      SizedBox(
        child:
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, "/projects/section=formal/name=nomProjet");
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
          label: const Text(
            "Voir plus",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(Icons.menu_open, color: Colors.white),
        ),
      )
    );
  }

  Widget buttonDonate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:
      SizedBox(
        child:
        ElevatedButton.icon(
          onPressed: () {
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), ),
          label: const Text(
            "Donner",
            style: TextStyle(color: Colors.black),
          ),
          icon: const Icon(Icons.volunteer_activism, color: Colors.black),
        ),
      )
    );
  }

  /// Widget for one card which is containing the information about a project.
  Widget projectsTemplate(){
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
                 //border:TableBorder.all(width: 2.0,color: Colors.red),
                children: [
                  TableRow(
                      children: [
                        const AutoSizeText(
                          "Projet au nom long sur 2 lignes maximum",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        Image.asset("assets/logo_solid_R.png", height: 60, width: 60,),
                        TextButton.icon(
                          onPressed: () {  },
                          icon: const Icon(Icons.favorite_border, color: Colors.black, size: 30,),
                          label: const Text(""),
                        ),
                      ]
                  ),
                ],
              )
            ),

            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(20.0))
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        minHeight: 15,
                        color: Color(0xFF0725A5),
                        backgroundColor: Colors.white,
                        value: 0.1, // % so between 0 and 1
                      ),
                    ),
                  ),

                  Container (
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Column(
                      children: const [
                        Text("50" " % financés"),
                        Text("Participation : " "30" " %")
                      ]
                    ),
                  )

                ],
              )
            ),

            const SizedBox(
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus gravida, bibendum leo et, hendrerit tellus. Praesent pulvinar euismod dui, non vehicula metus. Ut lobortis porta purus a eleifend. Mauris mollis et ante sit amet condimentum. Nam sollicitudin quis nisl vel laoreet. Aenean faucibus dolor ut ipsum facilisis, eu ultricies lacus pulvinar. ",
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
                buttonSeeMore(),
                const Spacer(),
                /* Button "Donner" */
                buttonDonate(),
              ],
            )
          ],
        ),
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
      body: CustomScrollView(
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
                  child: filterTemplate(),
                )
            ),

          /* Adding Cards to the app. To change with real function : Creation of many projects. */
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                      title: projectsTemplate(),
                  ),
                childCount: 10,
              ),
          ),
        ],
      )
    );
  }
}
