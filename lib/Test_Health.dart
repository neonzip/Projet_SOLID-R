import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';


Future<void> fetchFiles() async {
  var hlp = OAuth2Helper(
    GoogleOAuth2Client(
        redirectUri: 'com.teranet.app:/oauth2redirect',
        customUriScheme: 'com.teranet.app'),
    grantType: OAuth2Helper.AUTHORIZATION_CODE,
    clientId: '460987549848-9ecs5um0603g4f7ttlfa2dni23gsa6fa.apps.googleusercontent.com',
    clientSecret: 'XXX-XXX-XXX',
    scopes: ['https://www.googleapis.com/auth/fitness'],
  );
  //

  var resp = await hlp.get('https://www.googleapis.com/drive/v3/files');

  print(resp.body);
}

void testHealth() async {
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

  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory();

// define the types to get
  var types = [
    HealthDataType.STEPS,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.BLOOD_GLUCOSE,
  ];

  fetchFiles();
// requesting access to the data types before reading them
  bool requested = await health.requestAuthorization(types);

  fetchFiles();

  var now = DateTime.now();

// fetch health data from the last 24 hours
  List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      now.subtract(Duration(days: 1)), now, types);

// request permissions to write steps and blood glucose
  types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
  var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE
  ];
  await health.requestAuthorization(types, permissions: permissions);

// write steps and blood glucose
  bool success = await health.writeHealthData(10, HealthDataType.STEPS, now, now);
  success = await health.writeHealthData(3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

// get the number of steps for today
  var midnight = DateTime(now.year, now.month, now.day);
  int? steps = await health.getTotalStepsInInterval(midnight, now);


  print("TEEEEST HEALTH :");
  print(healthData[0].toString());
  print(healthData[1].toString());
}





class DailyStepsScreen extends StatefulWidget {
  @override
  _DailyStepsScreenState createState() => _DailyStepsScreenState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class _DailyStepsScreenState extends State<DailyStepsScreen> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;

  @override
  void initState() {
    super.initState();
  }


  Future<void> fetchData() async {
    /// Get everything from midnight until now
    DateTime startDate = DateTime(2020, 11, 07, 0, 0, 0);
    DateTime endDate = DateTime(2025, 11, 07, 23, 59, 59);

    HealthFactory health = HealthFactory();

    /// Define the types to get.
    List<HealthDataType> types = [
      HealthDataType.STEPS,
      HealthDataType.WEIGHT,
      HealthDataType.HEIGHT,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.DISTANCE_WALKING_RUNNING,
    ];

    setState(() => _state = AppState.FETCHING_DATA);


    /// You MUST request access to the data types before reading them
    bool accessWasGranted = await health.requestAuthorization(types);

    int steps = 0;

    if (accessWasGranted) {
      try {
        /// Fetch new data
        List<HealthDataPoint> healthData =
        await health.getHealthDataFromTypes(startDate, endDate, types);

        /// Save all the new data points
        _healthDataList.addAll(healthData);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      /// Filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      /// Print the results
      _healthDataList.forEach((x) {
        print("Data point: $x");
        steps += x.value.round();
      });

      print("Steps: $steps");

      /// Update the UI to display the results
      setState(() {
        _state =
        _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Text('Press the download button to fetch data');
  }

  Widget _authorizationNotGranted() {
    return Text('''Authorization not given.
        For Android please check your OAUTH2 client ID is correct in Google Developer Console.
         For iOS check your permissions in Apple Health.''');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();

    return _contentNotFetched();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () {
                fetchData();
              },
            )
          ],
        ),
        body: Center(
          child: _content(),
        )
    );

  }
}