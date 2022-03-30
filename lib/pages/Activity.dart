import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:projet_solid_r/Functions/Notification.dart';
import 'package:location/location.dart';
import 'package:projet_solid_r/pages/user/view/templates/Activity/ActivityButton.dart';
import 'package:projet_solid_r/pages/user/view/templates/Activity/FinishedActivityAlert.dart';
//import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

// Pour avoir la localisation background en continue, ajouter
//     <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
// Au fichier androidManifest

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  /*late FlutterIsolate isolate;

  Future<void> _start() async {
    print("PAAAAAAAAAAAAAAAAAAASSE");
    isolate = await FlutterIsolate.spawn(isolate1, "test");

  }
  Future<void> _resume() async { isolate.resume(); }
  Future<void> _pause() async { isolate.pause(); }
  Future<void> _stop() async { isolate.kill(); }
*/

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
  late double _numerox;
  late num _kmx; late double burnedx;
  num _coin = 0; late double _porciento;
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
          setState(() {
            _error = "";
            _location = currentLocation;
          });
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
      style: TextStyle(
        color: Colors.lightGreen[500],
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
      print("CEST RELOUUUU");

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
  void _onError(error) {
    if (kDebugMode) {
      print("Flutter Pedometer Error: $error");
    }
  }
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
    //print(distance.runtimeType);
    num coiny = ((_numerox * 125) / 100000);
    coiny = num.parse(coiny.toStringAsFixed(2));

    _stepsWalkx = _numerox - _initSteps;
    _kmWalkx = ((_stepsWalkx * 76) / 100000);
    setState(() {
      _km = "$distance";
      _kmWalk = "$_kmWalkx";
      _stepsWalk = "$_stepsWalkx";
      //print(_km);
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });

    setState(() {
      _coin = num.parse(coiny.toStringAsFixed(2));
      //print(_coiny);
    });
  }
  /////////////////////////////////


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [

            const Text(
              'Statut de marche :',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              _status == 'walking'
                  ? Icons.directions_walk
                  : _status == 'stopped'
                  ? Icons.accessibility_new
                  : Icons.airline_seat_recline_normal,
              size: 100,
            ),
            Center(
              child: Text(
                _status == "walking"
                  ? "Marche"
                  : _status == "stopped"
                  ? "Arrêt"
                  : "A l'arrêt",
                style: _status == 'walking' || _status == 'stopped'
                    ? const TextStyle(fontSize: 30)
                    : const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),

            //Pour afficher le nombre de pas effectués
            /*
            const Text(
              'nombre de pas actuels:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _stepsWalk,
              style: const TextStyle(fontSize: 60),
            ),
            */
            const Text(
              'km actuel:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _kmWalk,
              style: const TextStyle(fontSize: 60),
            ),

            const Text(
              'Temps actif:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _actualTime,
              style: const TextStyle(fontSize: 80),
            ),
            const Divider(
              height: 30,
              thickness: 0,
              color: Colors.white,
            ),

            // Location.speed
            const Text("Vitesse actuelle :",style: TextStyle(fontSize: 30)),
            _calculateSpeedBetweenLocations(),

            //Bouton pour envoyer une notif (a utiliser plus tard si on veut)
            IconButton(
              tooltip: "Notif",
                onPressed: () {
                  sendNotification(title: "Votre activité actuelle", body: "Vous avez parcouru $_kmWalk en $_actualTime secondes. Votre vitesse est de ${_location.speed != null && _location.speed! * 3600 / 1000 > 0
                      ? (_location.speed! * 3600 / 1000).toStringAsFixed(2)
                      : 0} KM/h");
                  },
                icon: const Icon(Icons.notification_important_rounded),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isPlayed,
                  child: ActivityButton(
                    icon: Icons.stop,
                    onPressedButton: () {
                      _isPlayed = false;
                      isFinished = true;
                      //_stop();
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
                Visibility(
                    visible: !_isPlayed,
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
                Visibility(
                    visible: _isPlayed,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}