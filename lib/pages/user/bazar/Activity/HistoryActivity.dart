import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/ActivityView.dart';
import 'package:projet_solid_r/pages/user/view/templates/Profile/OneWeekCompletedActivityContainer.dart';

class HistoryActivity extends StatefulWidget {
  const HistoryActivity({Key? key}) : super(key: key);

  @override
  _HistoryActivityState createState() => _HistoryActivityState();
}

class _HistoryActivityState extends State<HistoryActivity> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Suivi d'activité"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: OneWeekCompletedActivityContainer(
            startWeek: DateTime.now(),
            listCompletedActivity: [ActivityView(1, DateTime.now())],
            endWeek: DateTime.now(),
          ),
          padding: const EdgeInsets.all(10),
        )
    );
  }
}
