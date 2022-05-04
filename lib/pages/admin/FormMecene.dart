import 'package:flutter/material.dart';

class FormMecene extends StatefulWidget {
  const FormMecene({Key? key}) : super(key: key);

  @override
  _FormMeceneState createState() => _FormMeceneState();
}

class _FormMeceneState extends State<FormMecene> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        )
    );
  }
}