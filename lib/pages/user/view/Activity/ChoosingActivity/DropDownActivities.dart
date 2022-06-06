import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/dao/sportDAO.dart';
import 'package:projet_solid_r/pages/user/model/SportModel.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../templates/ProgressIndicatorAsync.dart';
import '../DoingActivity/Activity.dart';
import '../ActivityButton.dart';

class DropDownActivities extends StatefulWidget {
  final List<SportModel> list;
  final PageController controller;
  final UserModel user;

  const DropDownActivities({Key? key, required this.list, required this.controller, required this.user,}) : super(key: key);

  @override
  _DropDownActivitiesState createState() => _DropDownActivitiesState();
}

class _DropDownActivitiesState extends State<DropDownActivities> {
  List<String> nameSportList = [];

  bool isStarted = false;

  // string which contains the selected sport that the user want to do for real.
  String? theSport;

  late SportModel currentSport = widget.list.first;


  // string of the current sport chosen
  late String currentActivity = widget.list.first.sportName;

  @override
  void initState() {
    for (var element in widget.list) {
      nameSportList.add(element.sportName);
    }
    if (kDebugMode) {
      print(nameSportList.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dropDownActivities();
  }
  /// Widget which builds the dropdown with the list of activities.
  Widget dropDownActivities() {
    return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                elevation: 1,
                isExpanded: true,
                value: nameSportList.elementAt(0),
                focusColor: Colors.yellow,
                hint: const Text("Choisir un sport"),
                items: nameSportList.map(buildMenuItem).toList(),
                onChanged: (String? selectedValue) {
                  if (selectedValue is String) {
                    currentActivity = selectedValue;
                    setState(() {
                      var itemSelected = selectedValue;
                      nameSportList.remove(itemSelected);
                      //TODO:
                      print(nameSportList.toString());
                      nameSportList.insert(0, itemSelected!);
                      print(nameSportList.toString());
                      selectedValue = selectedValue;
                    }
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 80,),
          ActivityButton(
            onPressedButton: () {
              for (var element in widget.list) {
                if (element.sportName == currentActivity) {
                  currentSport = element;
                }
              }
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Activity(user: widget.user, sport: currentSport,)));
            },
            icon: Icons.play_circle_fill,
            color: Colors.blue[900],
            tooltip: 'Commencer',
          ),
          Text("Démarrer la séance de $currentActivity"),
        ],
    );
  }
}

/// Builds the menu inside the dropdown
/// And sets the first element of the container to the value selected previously.
DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
      value: item,
      child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )
      )
  );
}
