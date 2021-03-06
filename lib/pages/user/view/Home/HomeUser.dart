import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import '../../../MODEL/UserModel.dart';
import 'ContainerWithBackground.dart';
import 'HomeAppBar/HomeAppBar.dart';
import 'HomeBottomAppBar/HomeBottomAppBar.dart';
import 'HomeButtonActivity.dart';
import 'HomeBottomAppBar/HomeButtonAllProjects.dart';
import 'HomeInformationUser/HomeUserInformation.dart';
import 'HomeSponsors/HomeSponsors.dart';

/// Widget view which builds the entire widget for the home of the user part.
class HomeUser extends StatefulWidget {
  final UserModel user;
  const HomeUser({Key? key, required this.user}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

/// Widget state which builds the entire widget for the home of the user part.
class _HomeUserState extends State<HomeUser> {

  @override
  Widget build(BuildContext context) {
    setState(() {
    });
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF0725A5),
              title: HomeAppBar(user: widget.user),
          ),
        /// The customized widget ContainerWithBackground is created to add a background to the page we want to show.
          body: ContainerWithBackground(
            content: Center (
                child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      padding: MediaQuery.of(context).orientation == Orientation.landscape ? const EdgeInsets.only(top:10) : const EdgeInsets.only(top:150),
                      width: 500,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.55),
                          borderRadius: BorderRadius.circular(10), //border corner radius
                        ),
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            HomeUserInformation(
                                user: widget.user
                            ),

                            /// Blue horizontal line separating the two parts of the main page.
                            const SeparatorWithText(text: "Ils nous font confiance"),

                            /// Building a grid with the logos of associations.
                            HomeSponsors(context: context, user: widget.user,),
                          ],
                        ),
                      )
                    )
                )
            ),
          ),
          floatingActionButtonLocation: MediaQuery.of(context).orientation == Orientation.landscape ? null : FloatingActionButtonLocation.centerDocked,
          floatingActionButton: MediaQuery.of(context).orientation == Orientation.landscape ? Wrap(
            direction: Axis.vertical, //use vertical to show  on vertical axis
            children: [
              HomeButtonActivity(user: widget.user,),
              HomeButtonAllProjects(user: widget.user,),
            ],
          )
        :
          SizedBox(
            height: 100,
            width: 100,
            child: HomeButtonActivity(user: widget.user,),
          ),

          /// Menu at the bottom with the 2 other buttons "Projets" and "Favoris".
          bottomNavigationBar:  MediaQuery.of(context).orientation == Orientation.portrait ? HomeBottomAppBar(user: widget.user,) : null,
      )
    );
  }
}
