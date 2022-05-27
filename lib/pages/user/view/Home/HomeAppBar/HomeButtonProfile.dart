import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';

import '../../Profile/Profile.dart';

/// Displays the logo and add to it a gesture in order to have an hyperlink to go in the A propos page by clicking it.
class HomeButtonProfile extends StatelessWidget {
  final UserModel user;
  const HomeButtonProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Profile(user: user)));
                //Navigator.pushNamed(context, "/user/profile");
              },
              child: Column(
                children: const [
                  Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white
                  ),
                  Text(
                      "Profil",
                      style: TextStyle(color:Colors.white))
                ],
              ),
            ),
          )
      );
    }
  }