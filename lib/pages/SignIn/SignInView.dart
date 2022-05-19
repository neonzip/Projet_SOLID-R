import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/SignIn/SignInController.dart';

/// Widget which displays the page to sign uin.
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

/// Widget state which displays the page to sign in.
class _SignInViewState extends State<SignInView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: const Text("Connexion"),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: SignInController(),
        )
    );
  }
}
