import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/SignUp/SignUpController.dart';

/// Widget which displays the page to sign up.
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

/// Widget state which displays the page to sign up.
class _SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Inscription"),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: SignUpController(),
        )
    );
  }
}
