import 'package:flutter/material.dart';

class YellowBubbleDonations extends StatefulWidget {
  String valueDonations;
  YellowBubbleDonations({Key? key, required this.valueDonations}) : super(key: key);
  @override
  _YellowBubbleDonationsState createState() => _YellowBubbleDonationsState();
}

class _YellowBubbleDonationsState extends State<YellowBubbleDonations> {
  @override
  Widget build(BuildContext context) {
    return yellowBubbleDonations();
  }


  /// Yellow bubble containing the donations that the user made.
  Widget yellowBubbleDonations() {
    return Container(
      child:
      Column(
        children: [
          const Text(
              "Dons réalisés :",
              style: TextStyle(fontSize: 20)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  widget.valueDonations,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold)
              ),

              const Text(
                  " €",
                  style: TextStyle(fontSize: 20)
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)
        //more than 50% of width makes circle
      ),
      padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
      margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
    );
  }

}