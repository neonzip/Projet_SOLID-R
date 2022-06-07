import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../../../controller/fakeDataTest/DataProjectTest.dart';
import '../../../templates/ItemFilter.dart';
import '../../../templates/ProgressIndicatorAsync.dart';
import '../../OneProject/OverView/ProjectView.dart';
import '../ProjectsView.dart';

class Favorites extends StatefulWidget {
  final UserModel user;
  const Favorites({Key? key, required this.user,}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool? filterAll = false;
  bool? filterFavorite = true;
  bool isExpanded = false;

  /// List which will contain all the projects to display
  late Future<List<ProjectView>> listProjects;

  /// Widget for filter.
  Widget filterTemplate() {
    return Container(
        padding: const EdgeInsets.only(bottom: 15),
        //color: Colors.white,
        child: Column (
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ItemFilter(
                isSelected: filterAll,
                textItem: 'Tous',
                onChanged: (value) {
                  setState(() {
                    filterAll = value;
                    filterFavorite = false;
                    if (filterAll == true) {
                      listProjects = getListAllProjects();//DataProjectTest().getListSolidarityProjectsViews();
                      setState(() {
                      });
                    }
                    else {
                      if (filterFavorite == false) {
                        filterAll = true;
                      }
                    }
                  });
                }
            ),
            ItemFilter(
                isSelected: filterFavorite,
                textItem: 'Favoris',
                onChanged: (value) {
                  setState(() {
                    filterFavorite = value;
                    if (filterFavorite == true) {
                      filterAll = false;
                      listProjects = getListFavoriteProjects();//DataProjectTest().getListFavoriteSolidarityProjectsViews();
                      setState(() {
                      });
                    }
                    else{
                      filterAll = true;
                      listProjects = getListAllProjects();//DataProjectTest().getListSolidarityProjectsViews();
                      setState(() {
                      });
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
    listProjects = getListFavoriteProjects();//DataProjectTest().getListFavoriteSolidarityProjectsViews();
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
  int selectedFilter = 2; // 1 for All and 2 for favorites in this case

  /// Builder for the page of projects in the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            (MediaQuery.of(context).size.width >= 600) ? PopupMenuButton(
                tooltip: "Filtrer les projets",
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: const [
                    Text("Filtrer", style: TextStyle(color: Colors.yellow),),
                    Icon(Icons.arrow_drop_down, color: Colors.yellow,),
                  ],
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      selectedFilter = 1;
                      setState(() {
                        listProjects = getListAllProjects();//DataProjectTest().getListSolidarityProjectsViews();
                      });
                    },
                    child: Text('Tous', style: TextStyle(color: const Color(0xFF0725A5), fontWeight: (selectedFilter == 1)? FontWeight.bold : FontWeight.normal, decoration: (selectedFilter == 1) ? TextDecoration.underline : null),),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      selectedFilter = 2;
                      setState(() {
                        listProjects = getListFavoriteProjects();//DataProjectTest().getListFavoriteSolidarityProjectsViews();
                      });
                    },
                    child:  Text('Favoris', style: TextStyle(color: const Color(0xFF0725A5), fontWeight: (selectedFilter == 2)? FontWeight.bold : FontWeight.normal, decoration: (selectedFilter == 2) ? TextDecoration.underline : null),),
                  ),
                ]
            ) : Container(),
          ],
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Projets solidaires"),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFD7E1FF),

        /* Here is called our button to go back at the top of the page. */
        floatingActionButton: _showBackToTopButton == false ? null: buttonTopPage(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
        body: FutureBuilder<List<ProjectView>>(
            future: listProjects,
            builder: (
                BuildContext context,
                AsyncSnapshot<List<ProjectView>> snapshot,
                ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ProgressIndicatorAsync();
              }
              else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  if (kDebugMode) {
                    print("snap = " + snapshot.data.toString());
                  }
                  return Text('Erreur. ' + snapshot.error.toString());
                } else if (snapshot.hasData) {
                  return Center(
                    child: ProjectsView(
                      nbItemFilter: 2,
                      filter: filterTemplate(),
                      controller: _scrollController,
                      listProjects: snapshot.data!,
                      user: widget.user,
                    ), // Displays the specific projects of the chosen section on the screen
                  );
                } else {
                  return const Text('Aucune donnée');
                }
              } else {
                return Text("Etat : ${snapshot.connectionState}");
              }
            }
        )
    );
  }


  /// ///////////////////////
  /// Interaction with the DB
  /// ///////////////////////
  Future<List<ProjectView>> getListFavoriteProjects() async {
    return await DataProjectTest().getListFutureFavoriteSolidarityProjectsViews(widget.user.userID);
  }
  Future<List<ProjectView>> getListAllProjects() async {
    return await DataProjectTest().getListFutureSolidarityProjectsViewsWithFavorite(widget.user.userID);
  }
}
