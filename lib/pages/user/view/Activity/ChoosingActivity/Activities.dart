import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Activity/ChoosingActivity/DropDownActivities.dart';

import '../../../dao/sportDAO.dart';
import '../../../model/SportModel.dart';
import '../../templates/ProgressIndicatorAsync.dart';

class Activities extends StatefulWidget {
  final UserModel user;
  const Activities({Key? key, required this.user}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  late Future<List<SportModel>> listSports;
  late List<String> listNameSports;

  @override
  void initState() {
    listSports = SportDAO().getListOfSports();
    listNameSports = [];
    super.initState();
  }

  // string of the current sport chosen
  String? currentActivity;

  // string which contains the selected sport that the user want to do for real.
  String? theSport;

  PageController controller = PageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Activité"),
        centerTitle: true,
        ),
      body: FutureBuilder<List<SportModel>>(
          future: listSports,
          builder: (
              BuildContext context,
              AsyncSnapshot<List<SportModel>> snapshot,
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

                return  SingleChildScrollView(
                  /// If the activity is going to start, it displays the screen with the information about our activity.
                  /// Else, we have the list of the activities that we can choose.
               //   child: (isStarted == true) ? const Activity()
                  //    :
                      child:Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: const Text("Quel sport allez-vous pratiquer ?"),
                          ),
                          DropDownActivities(list: snapshot.data!, controller: controller, user: widget.user, ),
                        ]
                      )
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
}
