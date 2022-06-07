import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/MODEL/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Home/HomeUser.dart';

import 'admin/view/Home/HomeAdmin.dart';

/// Widget view which build the entire widget for the home page.
/// The displays page depends on the status of the user (admin or not).
class HomeView extends StatefulWidget {
  final UserModel user;           // User
  const HomeView({Key? key, required this.user}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

/// Widget state which build the entire widget for the home page.
class _HomeViewState extends State<HomeView> {

  /// Build of the widget, of the home page
  @override
  Widget build(BuildContext context) {

    /// If the user is an admin, he is redirected on the admin part
    if (widget.user.userIsAdmin) {
      return HomeAdmin(user: widget.user);
    }
    /// If the user is a standard user, he is redirected on the user part
    return HomeUser(user: widget.user);
  }
}
