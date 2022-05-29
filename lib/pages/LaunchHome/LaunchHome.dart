import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/LaunchHome/ImageWithSlogan/ImageWithSlogan.dart';
import 'package:projet_solid_r/pages/LaunchHome/PartOut/PartOut.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'PartIn/PartIn.dart';

class LaunchHome extends StatefulWidget {
  const LaunchHome({Key? key}) : super(key: key);

  @override
  _LaunchHomeState createState() => _LaunchHomeState();
}

class _LaunchHomeState extends State<LaunchHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0725A5),
          title: Center(child:Image.asset('assets/logo_solid_R.png',)),
        ),
        backgroundColor: Colors.white,
        body: FooterView(
          footer: Footer(
            padding: const EdgeInsets.all(0),
            child: Image.asset("assets/footerWhite.png"),
          ),
          children: <Widget>[
            const ImageWithSlogan(),
            SizedBox(
              width: 500,
              child: Column(
                  children: const [
                    PartIn(),
                    SeparatorWithText(
                        text: "OU"
                    ),
                    PartOut(),
                  ]
              ),
            ),

          ]
        ),
    );
  }
}
