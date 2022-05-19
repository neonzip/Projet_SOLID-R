import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/HomeAdmin.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/HomeUser.dart';

class Home extends StatefulWidget {
  final UserModel user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    if (widget.user.userIsAdmin) {
      return HomeAdmin(user: widget.user);
    }
    return HomeUser(user: widget.user);
  }
}
