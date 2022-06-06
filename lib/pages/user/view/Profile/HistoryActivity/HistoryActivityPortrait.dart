import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/ActivityView.dart';
import 'package:projet_solid_r/pages/user/view/Profile/HistoryActivity/OneWeekCompletedActivityContainer.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';

class HistoryActivityPortrait extends StatefulWidget {
  const HistoryActivityPortrait({Key? key}) : super(key: key);

  @override
  _HistoryActivityPortraitState createState() => _HistoryActivityPortraitState();
}

class _HistoryActivityPortraitState extends State<HistoryActivityPortrait> {

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
                listCompletedActivity: [ActivityView("1", DateTime.now())],
                endWeek: DateTime.now(),
              ),
              OneWeekCompletedActivityContainer(
                startWeek: DateTime.now(),
                listCompletedActivity: [ActivityView("1", DateTime.now())],
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
