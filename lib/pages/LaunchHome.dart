import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/SigninButton.dart';
import 'package:projet_solid_r/pages/user/templates/SignupButton.dart';

class LaunchHome extends StatefulWidget {
  const LaunchHome({Key? key}) : super(key: key);

  @override
  _LaunchHomeState createState() => _LaunchHomeState();
}

class _LaunchHomeState extends State<LaunchHome> {

  /// Widget which contributes to create a textfield.
  Widget textFieldTemplate(String labelData, String? labelDataHint) {
    return
      Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(labelData),
              ),

              TextField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  suffixIcon: const Icon(Icons.create_outlined, color: Colors.black,), //icon at tail of input
                  hintText: labelDataHint,
                ),
              ),
            ],
          )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0725A5),
          title: Image.asset('assets/logo_solid_R.png'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 500,
              child: Column(
                children: [
                  SigninButton(
                    onPressed:  () {
                      Navigator.pushNamed(context, "/signin");
                    },
                  ),
                  const SignupButton(),
                ],
              ),
            )
          )
        )
    );
  }
}
