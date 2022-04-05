import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import '../../../bazar/Activity/ActivityView.dart';

const TableRow rowSpacer = TableRow(
    children: [
      SizedBox(height: 20,),
      SizedBox(height: 20,),
      SizedBox(height: 20,),
    ]
);

/// Table/Container which contains a list of completed activities.
/// We call it to build a table for every week in the "Activités réalisée" page.
class OneWeekCompletedActivityContainer extends StatefulWidget {
  final List<ActivityView> listCompletedActivity;
  final DateTime startWeek;
  final DateTime endWeek;

  const OneWeekCompletedActivityContainer({Key? key, required this.listCompletedActivity, required this.endWeek, required this.startWeek}) : super(key: key);
  @override
  _OneWeekCompletedActivityContainerState createState() => _OneWeekCompletedActivityContainerState();
}

class _OneWeekCompletedActivityContainerState extends State<OneWeekCompletedActivityContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SeparatorWithText(
                text: "DATE semaine",
              ),
              Table(
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
              ),
            ],
          )
      )
    );
  }
}