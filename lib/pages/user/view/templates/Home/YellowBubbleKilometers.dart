import 'package:flutter/material.dart';

class YellowBubbleKilometers extends StatefulWidget {
  final String valueKilometers;
  const YellowBubbleKilometers({Key? key, required this.valueKilometers}) : super(key: key);
  @override
  _YellowBubbleKilometersState createState() => _YellowBubbleKilometersState();
}

class _YellowBubbleKilometersState extends State<YellowBubbleKilometers> {
  @override
  Widget build(BuildContext context) {
    return yellowBubbleKilometers();
  }

  /// Yellow bubble containing the kilometers traveled.
  Widget yellowBubbleKilometers() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/activityHistory");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10), //border corner radius
          boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(0.6), //color of shadow
              blurRadius: 3, // blur radius
              offset: const Offset(0, 1), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
          ],
        ),
        child:
        Column (
            children: [
              const Text("Kilomètres parcourus :",
                  style: TextStyle(fontSize: 20)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.valueKilometers,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      )
                  ),

                  const Text(" km",
                      style: TextStyle(fontSize: 20)
                  ),
                ],
              ),
            ]
        ),
        padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
        margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),

      ),
    );
  }
}