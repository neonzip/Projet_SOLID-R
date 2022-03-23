import 'dart:developer';

import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  String errorMessage;
  String label;
  String labelHint;

  FormTextField({Key? key, required this.errorMessage, required this.labelHint, required this.label}) : super(key: key);
  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  @override
  Widget build(BuildContext context) {
    return textFieldTemplate();
  }

  /// Widget which contributes to create a textfield.
  Widget textFieldTemplate() {
    return
      Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(widget.label),
              ),

              TextField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  suffixIcon: const Icon(Icons.create_outlined, color: Colors.black,), //icon at tail of input
                  hintText: widget.labelHint,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(widget.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
      );
  }
}