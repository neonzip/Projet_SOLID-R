import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ActivityModel.dart';

/// Class of one instance of activity.
class ActivityView extends ActivityModel{
  var item = "sport";//DataSportTest().getNameSportDataList().elementAt(1);
  //!!!!!/
  // int userid = 1 ;
  //int sportid = 1 ;
  ActivityView(String activity, DateTime startDate) : super(activity, startDate);

  /// One row which is containing the information about a completed activity.
  TableRow activityTemplate(){
    return TableRow(
      children: [
        TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
          child: AutoSizeText(item),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                      "9.5 km",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Text(
                    "01:28:42",
                    style: TextStyle(
                      fontSize: 12,
                    )
                )
              ],
            ),
        ),
        const TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(
              "1.70 € cagnottés\nle XX/XX",
              textAlign: TextAlign.center,
            ),
        ),
      ]
    );
  }
}