import 'package:flutter/material.dart';

class FormAssociation extends StatefulWidget {
  const FormAssociation({Key? key}) : super(key: key);

  @override
  _FormAssociationState createState() => _FormAssociationState();
}

class _FormAssociationState extends State<FormAssociation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        )
    );
  }
}