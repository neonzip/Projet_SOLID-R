import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';

import '../../../admin/view/Home/HomeAdmin.dart';

/// Widget to go to admin page.
class ToAdminButton extends StatelessWidget {
  final double width;
  final UserModel user;

  const ToAdminButton({Key? key, required this.width, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HomeAdmin(user: user)));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        child: const Text(
          "Continuer en tant qu'administrateur",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}