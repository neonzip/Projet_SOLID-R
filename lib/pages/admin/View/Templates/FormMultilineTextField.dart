import 'package:flutter/material.dart';

class FormMultilineTextField extends StatefulWidget {
  final String errorMessage;
  final String label;
  final String labelHint;
  final TextEditingController textEditingController;

  const FormMultilineTextField({Key? key, required this.errorMessage, required this.labelHint, required this.label, required this.textEditingController}) : super(key: key);
  @override
  _FormMultilineTextFieldState createState() => _FormMultilineTextFieldState();
}

class _FormMultilineTextFieldState extends State<FormMultilineTextField> {

  @override
  Widget build(BuildContext context) {
    return textFieldTemplate();
  }

  /// Widget which contributes to create a text area.
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
                  controller: widget.textEditingController,
                  maxLines: 10,
                  //textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: widget.labelHint,
                  ),
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