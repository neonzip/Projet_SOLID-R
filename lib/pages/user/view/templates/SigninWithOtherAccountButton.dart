import 'package:flutter/material.dart';

class SigninWithOtherAccountButton extends StatefulWidget {
  final void Function()? onPressed;
  final String name;
  final String logo;

  const SigninWithOtherAccountButton({Key? key, required this.onPressed, required this.name, required this.logo}) : super(key: key);
  @override
  _SigninWithOtherAccountButtonState createState() => _SigninWithOtherAccountButtonState();
}

class _SigninWithOtherAccountButtonState extends State<SigninWithOtherAccountButton> {

  @override
  Widget build(BuildContext context) {
    return buttonSigninTemplate();
  }

  /// Widget building the button to signin.
  Widget buttonSigninTemplate() {
    String name = widget.name;
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 50,
      child:
      ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(
            0xFFF8F8F8))),
        child: Row(
          children: [
            Text(
              "Se connecter avec $name",
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            SizedBox(
              child: Image.asset(
                widget.logo,
                width: 40,
                height: 40,
              ),
            )
          ],
        )
      ),
    );
  }
}