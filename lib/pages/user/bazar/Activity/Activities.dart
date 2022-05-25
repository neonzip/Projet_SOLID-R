import 'package:flutter/material.dart';

import '../../../Activity.dart';
import '../../controller/fakeDataTest/DataSportTest.dart';
import '../../view/templates/Activity/ActivityButton.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {

  // List in the dropdown list that we have to replace by the list in the database
  var items =  DataSportTest().getNameSportDataList();

  // string for next selected value in the dropdown list
  String? _dropdownValue;

  // string of the current sport chosen
  String? currentActivity;

  // string which contains the selected sport that the user want to do for real.
  String? theSport;

  bool isStarted = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Activité"),
        centerTitle: true,
        ),
      body: Center(
        child: choseCurrentScreen(),
      )
    );
  }

  /// If the activity is going to start, it displays the screen with the information about our activity.
  /// Else, we have the list of the activities that we can choose.
  Widget choseCurrentScreen() {
    if (isStarted == true) {
      return const Activity();
    }
    else {
      return displaySelectionActivity();
    }
  }

  /// Display the screen in which we can select and launch an activity.
  Widget displaySelectionActivity() {
    currentActivity = items.first.toString();
    return Container(
      width: 500,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text("Quel sport allez-vous pratiquer ?"),
          /* Display the dropdown list with the activities that the user can do. */
          dropDownActivities(),
          const Spacer(),
          ActivityButton(
            onPressedButton: () {
              //Navigator.pushNamed(context, "/activityAxel");
              setState(() {
                isStarted = !isStarted;
              });
            },
            icon: Icons.play_circle_fill,
            color: Colors.blue[900],
            tooltip: 'Commencer',
          ),
          Text("Démarrer la séance de $currentActivity"),
          const Spacer(),
        ],
      ),
    );
  }

  /// Widget which builds the dropdown with the list of activities.
  Widget dropDownActivities() {
    return Container(
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
          value: items.elementAt(0),
          focusColor: Colors.yellow,
          hint: const Text("Choisir un sport"),
          items: items.map(buildMenuItem).toList(),
          onChanged: dropDownCallback,
        ),
      ),
    );
  }

  /// Called when a new item in the list is selected.
  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
        var itemSelected = selectedValue;
        items.remove(itemSelected);
        items.insert(0, itemSelected);
        currentActivity = selectedValue;
      }
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
}
