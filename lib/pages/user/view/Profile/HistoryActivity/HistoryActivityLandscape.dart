import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Activity/ActivityView.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/OneWeekCompletedActivityContainer.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';

class HistoryActivityLandscape extends StatefulWidget {
  const HistoryActivityLandscape({Key? key}) : super(key: key);

  @override
  _HistoryActivityLandscapeState createState() => _HistoryActivityLandscapeState();
}

class _HistoryActivityLandscapeState extends State<HistoryActivityLandscape> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
