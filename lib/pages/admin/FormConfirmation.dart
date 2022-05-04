import 'package:flutter/material.dart';

class FormConfirmation extends StatefulWidget {
  const FormConfirmation({Key? key}) : super(key: key);

  @override
  _FormConfirmationState createState() => _FormConfirmationState();
}

class _FormConfirmationState extends State<FormConfirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Confirmation", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        )
    );
  }
}