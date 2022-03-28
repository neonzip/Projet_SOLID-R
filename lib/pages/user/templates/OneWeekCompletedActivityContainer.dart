import 'package:flutter/material.dart';

import '../view/ActivityView.dart';

const rowSpacer = TableRow(
    children: [
      SizedBox(height: 20,),
      Spacer(),
      Spacer(),
    ]
);

/// Table/Container which contains a list of completed activities.
/// We call it to build a table for every week in the "Activités réalisée" page.
class OneWeekCompletedActivityContainer extends StatefulWidget {
  List<ActivityView> listCompletedActivity;
  DateTime startWeek;
  DateTime endWeek;

  OneWeekCompletedActivityContainer({Key? key, required this.listCompletedActivity, required this.endWeek, required this.startWeek}) : super(key: key);
  @override
  _OneWeekCompletedActivityContainerState createState() => _OneWeekCompletedActivityContainerState();
}

class _OneWeekCompletedActivityContainerState extends State<OneWeekCompletedActivityContainer> {
  @override
  Widget build(BuildContext context) {
    return Table(
      /* columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(2),
        },*/
        children: [
          ActivityView(1, DateTime.now()).activityTemplate(),
          rowSpacer,
          ActivityView(1, DateTime.now()).activityTemplate(),
          rowSpacer,
          ActivityView(1, DateTime.now()).activityTemplate(),
          rowSpacer,
          ActivityView(1, DateTime.now()).activityTemplate(),
          rowSpacer,
          ActivityView(1, DateTime.now()).activityTemplate(),
        ]
    );
  }
}