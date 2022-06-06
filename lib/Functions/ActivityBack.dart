import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_isolate/flutter_isolate.dart';
import 'dart:async';
import 'dart:math';
import 'package:pedometer/pedometer.dart';
import 'package:projet_solid_r/Functions/Notification.dart';
import 'package:location/location.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

import '../pages/user/view/Activity/DoingActivity/Activity.dart';
// Import
//import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;




void isolate1(String arg) async {
// Right before you would be doing any loading
 // WidgetsFlutterBinding.ensureInitialized();

  //await file.writeAsString(json);

  int num = 1;
  ActivityBack activity;
  Timer.periodic(
      const Duration(milliseconds: 500), (timer) async {

          print("DANS LE ISOLATE");

          //if(file!=null) {
          File files = File("/data/user/0/com.example.projet_solid_r/app_flutter/json.json");
            String json = await files.readAsString();
            // String response = await rootBundle.loadString('assets/json.json');

            print("REPONSE :"+json);
            ActivityBack activity = ActivityBack.fromJson(jsonDecode(json));

            sendNotification(title: "Votre activité actuelle", body: "${activity._kmWalk} km parcouru en ${activity._actualTime}. Vitesse : ${activity._location != null && activity._location! * 3600 / 1000 > 0
                ? (activity._location! * 3600 / 1000).toStringAsFixed(2)
                : 0} KM/h");
          //}

  } );
  Timer.periodic(const Duration(seconds: 1), (timer) {
    //addTime();
  });
}


class ActivityBack {
  late String _kmWalk;
  late String _actualTime;
  late double? _location;

  ActivityBack(this._kmWalk, this._actualTime, this._location);

  ActivityBack.fromJson(Map<String, dynamic> json)
      : _kmWalk = json['_kmWalk'],
        _actualTime = json['_actualTime'],
  _location = json['_location'];

  Map<String, dynamic> toJson() => {
    '_location': _location,
    '_kmWalk': _kmWalk,
    '_actualTime': _actualTime,
  };

}