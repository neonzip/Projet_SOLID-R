import 'package:flutter/material.dart';

class FormTextFieldWithContentAdmin extends StatefulWidget {
  final String errorMessage;
  final String label;
  final String labelHint;
  final String text;

  final TextInputType inputType;

  const FormTextFieldWithContentAdmin({Key? key, required this.text, required this.errorMessage, required this.labelHint, required this.label, required this.inputType}) : super(key: key);

  @override
  _FormTextFieldWithContentAdminState createState() => _FormTextFieldWithContentAdminState();
}

class _FormTextFieldWithContentAdminState extends State<FormTextFieldWithContentAdmin> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = widget.text;
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
                  controller: textEditingController,
                  keyboardType: widget.inputType,
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