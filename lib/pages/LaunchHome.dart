import 'package:flutter/material.dart';

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

  /// Widget building the button to signin.
  Widget buttonSigninTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signin");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
        child: const Text(
          "Se connecter",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// Widget building the button to signup.
  Widget buttonSignupTemplate() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        child: const Text(
          "S'inscrire avec un email",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
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
          child: Column(
            children: [
              buttonSigninTemplate(),
              buttonSignupTemplate(),
            ],
          ),
        )
    );
  }
}
