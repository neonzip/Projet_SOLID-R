import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/view/templates/Separator.dart';
import 'package:projet_solid_r/pages/user/view/templates/SeparatorWithText.dart';
import 'package:projet_solid_r/pages/user/view/templates/SigninButton.dart';
import 'package:projet_solid_r/pages/user/view/templates/SignupButton.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Martin.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF0725A5),
                        gradient: RadialGradient(
                          radius: 0.6,
                          colors: [
                            const Color(0xFF0725A5).withOpacity(0.8),
                            const Color(0xFF0725A5),
                          ],
                        )
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        AutoSizeText("Avancons ensemble vers un sport\n", style: TextStyle(fontSize: 15, color: Colors.white)),
                        AutoSizeText("+ inclusif\n+ responsable\n+ solidaire", style: TextStyle(fontSize: 15, color: Colors.yellow)),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                width: 500,
                child: Column(
                  children: [
                    SigninButton(
                      onPressed:  () {
                        Navigator.pushNamed(context, "/signin");
                      },
                    ),
                    SignupButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      }, text: "S'inscrire avec un email",
                    ),
                    const SeparatorWithText(
                      text: "OU"
                    ),
                    Image.asset("assets/footerWhite.png")
                  ]
                ),
              ),
            ]),
        )
    );
  }
}
