import 'package:flutter/material.dart';

class ProjectProgressBar extends StatefulWidget {
  double? valueBar;
  ProjectProgressBar({Key? key, required this.valueBar}) : super(key: key);
  @override
  _ProjectProgressBarState createState() => _ProjectProgressBarState();
}

class _ProjectProgressBarState extends State<ProjectProgressBar> {
  @override
  Widget build(BuildContext context) {
    return progressBar();
  }

  Widget progressBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          minHeight: 15,
          color: const Color(0xFF0725A5),
          backgroundColor: Colors.white,
          value: widget.valueBar, // % so between 0 and 1
        ),
      ),
    );
  }

}