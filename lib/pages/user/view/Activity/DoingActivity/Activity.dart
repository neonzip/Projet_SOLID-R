import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:location/location.dart';
import 'package:projet_solid_r/Functions/Notification.dart';
import 'package:projet_solid_r/pages/user/dao/UserDAO.dart';
import 'package:projet_solid_r/pages/user/dao/activityDAO.dart';
import 'package:projet_solid_r/pages/user/model/ActivityModel.dart';
import 'package:projet_solid_r/pages/user/model/SportModel.dart';

import '../../../model/UserModel.dart';
import 'FinishedActivityAlert.dart';
import '../ActivityButton.dart';

// Pour avoir la localisation background en continu, ajouter
//     <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
// Au fichier androidManifest

class Activity extends StatefulWidget {
  final UserModel user;
  final SportModel sport;

  const Activity({Key? key, required this.user, required this.sport}) : super(key: key);
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  DateTime dateStart = DateTime.now();
  late DateTime dateEnd;

  // Variables utilisables dans les widgets
  bool _isPlayed = true;
  String _stepsWalk = "0";
  String _kmWalk = "0";
  String _actualTime = "0";
  String _status = '?', _steps = '?';
  bool isFinished = false;
  ////////////////////////////////////////////

  // sensors
  double velocity = 0;
  double highestVelocity = 0.0;
  ////////////////////////////////////////

  // Location
  Location location = Location();

  late LocationData _location;
  late StreamSubscription<LocationData> _locationSubscription;
  late String _error;


  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  double _locSpeed = 0;
  /////////////////////////////////////////

  // Podometer
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String muestrePasos = ""; String _km = "Unknown";
  String _calories = "Unknown"; String stepCountValue = 'Unknown';
  String _showcoin = '0'; late StreamSubscription<StepCount> _subscription;
  late num _kmx; late double burnedx;
  num _coin = 0;
  late double _distanceRun; double _stepsWalkx = 0;
  double _kmWalkx = 0;

  bool _isFirstTime = true; double _initSteps = 0;
  ///////////////////////////////////////

  // Timer
  Timer? timer;
  Duration duration = const Duration();
  /////////////////////////////////////////

  @override
  void initState() {
    sendNotification(
      title: "Séance de ${widget.sport.sportName}",
      body: "Temps : $timer\nDistance : $_km\nGains obtenus : $_coin",
    );
    _coin = 0;
    super.initState();
    _listenLocation1();

    initPlatformState();

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      addTime();
      /*
      ActivityBack activity = ActivityBack(_kmWalk, _actualTime, _location.speed);
      String json = jsonEncode(activity);

      final Directory directory = await getApplicationDocumentsDirectory();
      File file = File('${directory.path}/json.json');
      print("PAAAAAAATH : "+directory.path);
      print(await file.readAsString());
      await file.writeAsString(json);
      */
      if (isFinished == true) {
        timer.cancel();
      }
    });
  }


  Future<bool> enableBackgroundMode() async {
    bool _bgModeEnabled = await location.isBackgroundModeEnabled();
    if (_bgModeEnabled) {
      return true;
    } else {
      try {
        await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      try {
        _bgModeEnabled = await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      if (kDebugMode) {
        print(_bgModeEnabled);
      } //True!
      return _bgModeEnabled;
    }
  }
//////////////////////// Location //////////////////////
  Future<void> _listenLocation1() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
          setState(() {
            _error = err.code;
          });
          _locationSubscription.cancel();
        }).listen((LocationData currentLocation) {
          _error = "";
          _location = currentLocation;
        });


    enableBackgroundMode();
    //location.enableBackgroundMode(enable: true);
    _locationData = await location.getLocation();
  }
  Future<void> _stopListen() async {
    _locationSubscription.cancel();
  }
  Widget _calculateSpeedBetweenLocations() {
    // Check if location is empty
    if (_location.speed == null) return const Text("Tenez bon !");
    return Text(
      '${_location.speed != null && _location.speed! * 3600 / 1000 > 0
          ? (_location.speed! * 3600 / 1000).toStringAsFixed(2)
          : 0} KM/h',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 50,
        letterSpacing: 4,
      ),
    );
  }
  ///////////////////////////

  /////////////////////// Timer //////////////////////
  void addTime() {
    const addSeconds = 1;
    if (_isPlayed) {
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        duration = Duration(seconds: seconds);

        _actualTime = "";
        if (duration.inHours != 0) {
          setState(() {
            _actualTime += "${twoDigit(duration.inHours)}:";
          });
        }

        if(duration.inMinutes != 0) {
          setState(() {
            _actualTime += "${twoDigit(duration.inMinutes.remainder(60))}:";
          });
        }

        setState(() {
          _actualTime += twoDigit(duration.inSeconds.remainder(60));
        });

      });

    }

    //_getCurrentLocation();
    //_listenLocation2();
  }
  String twoDigit(int n) => n.toString().padLeft(2, "0");
///////////////////////////////////

  ////////////////////// Pedometer ////////////////////////////
  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    //_stepCountStream.listen(onStepCount).onError(onStepCountError);
    _stepCountStream.listen(onStepCount, onError: _onError, onDone: _onDone, cancelOnError: true);
    if (!mounted) return;
  }
  void reset() {
    setState(() {
      int stepCountValue1 = 0;
      stepCountValue1 = 0;
      stepCountValue = "$stepCountValue1";
    });
  }
  void _onDone() {}
  void _onError(error) { if (kDebugMode) { print("Flutter Pedometer Error: $error"); } }
  void onStepCount(StepCount event) {
    if (kDebugMode) {
      print("onStepCount : $event");
    }
    if(_isFirstTime == true) {
      _initSteps = event.steps + 0.0;
      _isFirstTime = false;
    }
    if (_isPlayed) {
      getDistanceRun(event.steps + 0.0);
    }
    setState(() {
      _steps = event.steps.toString();
    });
    if (kDebugMode) {
      print("stepsWalk : " +_stepsWalk + " kmWalk : " + _kmWalk);
    }
  }
  void onPedestrianStatusChanged(PedestrianStatus event) {
    if (kDebugMode) {
      print("OnPedestrianStatusChanged : $event");
    }
    setState(() {
      _status = event.status;
    });
  }
  void onPedestrianStatusError(error) {
    if (kDebugMode) {
      print('onPedestrianStatusError: $error');
    }
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    if (kDebugMode) {
      print(_status);
    }
  }
  void onStepCountError(error) {
    if (kDebugMode) {
      print('onStepCountError: $error');
    }
    setState(() {
      _steps = 'Step Count not available';
    });
  }
  void getDistanceRun(double _numerox) {
    num distance = ((_numerox * 76) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); //dos decimales
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));

    _stepsWalkx = _numerox - _initSteps;
    _kmWalkx = ((_stepsWalkx * 76) / 100000);
    num coiny = (_kmWalkx * widget.sport.sportConversionRate);
    coiny = num.parse(coiny.toStringAsFixed(2));
    setState(() {
      _km = "$distance";

      _kmWalk = _kmWalkx.toStringAsFixed(2);
      _stepsWalk = "$_stepsWalkx";
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
      _coin = num.parse(coiny.toStringAsFixed(2));
    });
  }
  /////////////////////////////////


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0725A5),
            title: const Text("Activité"),
            centerTitle: true,
          ),
          persistentFooterButtons: [
            getFooter(),
          ],
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 20,
                      color: (_status == 'walking')
                          ? Colors.green
                          : _status == 'stopped'
                          ? Colors.red
                          : Colors.blue,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Séance de ${widget.sport.sportName}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 150,),
                    Column(
                      children: [
                        Text(
                          '$_coin €',
                          style: const TextStyle(fontSize: 45),
                        ),
                        const Text("Argent obtenu"),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Table(
                        children: [
                          TableRow(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      _actualTime,
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                    const Text('Temps'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$_kmWalk km",
                                      style: const TextStyle(fontSize: 40),
                                    ),
                                    const Text('Distance parcourue',),
                                  ],
                                )
                              ]
                          )
                        ]
                    ),
                  ],
                ),
              )
          ),
    );

  }

  /// Returns a widget with the action buttons play/pause/stop
  Widget getFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: true,
          child: ActivityButton(
            icon: Icons.stop,
            onPressedButton: () {
              _isPlayed = false;
              isFinished = true;
              dateEnd = DateTime.now();
              /// Here we add the finished activity to the database,
              /// We modify the user's purse and its reached kilometers.
              ActivityModel newActivity = ActivityModel("", dateStart);
              print(dateEnd.toString() + "icuuuuuuuuuuuuuuu");
              newActivity.setActivityEndDate(dateEnd);
              newActivity.setSportID(widget.sport.sportID);

              newActivity.setActivityDistance(double.parse(_kmWalk));
              newActivity.setUserID(widget.user.userID);
              newActivity.setCoin(double.parse(_coin.toString()));

              activityDAO().addActivity(newActivity);

              UserDAO().setPurseUser(widget.user, widget.user.userPurse + _coin);
              UserDAO().setKilometersUser(widget.user, widget.user.userTotalDistance + double.parse(_kmWalk));

              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      FinishedActivityAlert(
                        coins: _coin,
                        onPressedButton: () {
                          _stopListen();
                          },
                        kilometers: _kmWalk,
                      )
              );
            },
            color: Colors.red,
            tooltip: 'Arrêter l\'activité',
          ),
        ),
        (_isPlayed == true)?
        Visibility(
            visible: true,
            child: ActivityButton(
              icon: Icons.pause_circle_filled,
              onPressedButton: () {
                //_pause();
                setState(() {
                  _isPlayed = !_isPlayed;
                });
              },
              color: Colors.blue[900],
              tooltip: 'Faire une pause',
            )
        )
            :
        Visibility(
            visible: true,
            child: ActivityButton(
              onPressedButton: () {
                //reset();
                //_resume();
                setState(() {
                  _isPlayed = !_isPlayed;
                });
              },
              icon: Icons.play_circle_fill,
              color: Colors.blue[900],
              tooltip: 'Commencer ou continuer l\'activité',
            )
        ),
      ],
    );
  }
}