import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  // List in the dropdown list that we have to replace by the list in the database
  var items = ['Basketball', 'Vélo', 'Running'];

  // string for next selected value in the dropdown list
  String? _dropdownValue;

  // string which contains the selected sport that the user want to do for real.
  String? theSport;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Suivi d'activité"),
        centerTitle: true,
        ),
      body: Center(
        child: Container(
          width: 500,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text("Quel sport allez-vous pratiquer ?"),
              /* Display the dropdown list with the activities that the user can do. */
              dropDownActivities(),
              FlatButton.icon(
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      final permissionStatus = Permission.activityRecognition.request();
                      if (await permissionStatus.isDenied ||
                      await permissionStatus.isPermanentlyDenied) {
                        Fluttertoast.showToast(
                            msg: "This is Center Short Toast",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            fontSize: 16.0
                        );
                        return;
                      }
                    }
                    Navigator.pushNamed(context, "/activities/activity");
                  },
                  icon: const Icon(Icons.notification_important_rounded),
                  label: const Text("test"))
            ],
          ),
        )
      )
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
          value: items.first,
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
