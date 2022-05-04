import 'package:flutter/material.dart';

class FormProject extends StatefulWidget {
  const FormProject({Key? key}) : super(key: key);

  @override
  _FormProjectState createState() => _FormProjectState();
}

class _FormProjectState extends State<FormProject> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Projet", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        )
    );
  }
}