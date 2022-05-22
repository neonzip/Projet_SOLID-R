import 'dart:ffi';

import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final String errorMessage;
  final String label;
  final String labelHint;
  final String text;
  final bool hidden;
  final TextEditingController textEditingController;

  const FormTextField({Key? key, required this.errorMessage, required this.labelHint, required this.hidden, required this.label, required this.text, required this.textEditingController}) : super(key: key);
  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  @override
  void initState() {
    super.initState();
  }

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

              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: TextField(
                  obscureText: widget.hidden,
                  controller: widget.textEditingController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    suffixIcon: const Icon(Icons.create_outlined, color: Colors.black,), //icon at tail of input
                    hintText: widget.labelHint,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  widget.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
      );
  }
}