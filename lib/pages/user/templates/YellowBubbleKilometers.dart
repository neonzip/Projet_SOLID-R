import 'package:flutter/material.dart';

class YellowBubbleKilometers extends StatefulWidget {
  String valueKilometers;
  YellowBubbleKilometers({Key? key, required this.valueKilometers}) : super(key: key);
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
    return Container(
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
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        //more than 50% of width makes circle
      ),
    );
  }
}