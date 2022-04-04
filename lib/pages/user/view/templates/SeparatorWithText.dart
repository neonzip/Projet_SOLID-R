import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/FormTextField.dart';
import 'package:projet_solid_r/pages/user/view/templates/MessageSnackbar.dart';
import 'package:projet_solid_r/pages/user/view/templates/SignupButton.dart';

class SeparatorWithText extends StatefulWidget {
  final String text;
  const SeparatorWithText({Key? key, required this.text}) : super(key: key);

  @override
  _SeparatorWithTextState createState() => _SeparatorWithTextState();
}

class _SeparatorWithTextState extends State<SeparatorWithText> {

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              color: Color(0xFF0725A5),
              height: 50,
            )),
      ),

      Text(
          widget.text,
        style: const TextStyle(color: Color(0xFF0725A5), fontWeight: FontWeight.bold),
      ),

      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              color: Color(0xFF0725A5),
              height: 50,
            )),
      ),
    ]);
  }
}