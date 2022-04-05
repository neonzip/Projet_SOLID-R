import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/bazar/Activity/ActivityView.dart';
import 'package:projet_solid_r/pages/user/view/templates/Profile/OneWeekCompletedActivityContainer.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';

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
          title: const Text("Activités réalisées"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              OneWeekCompletedActivityContainer(
                startWeek: DateTime.now(),
                listCompletedActivity: [ActivityView(1, DateTime.now())],
                endWeek: DateTime.now(),
              ),
              OneWeekCompletedActivityContainer(
                startWeek: DateTime.now(),
                listCompletedActivity: [ActivityView(1, DateTime.now())],
                endWeek: DateTime.now(),
              ),
              const SizedBox(
                width: 500,
                child: Separator(),
              )
            ],
          )
        )
    );
  }
}
