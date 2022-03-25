import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/SigninButton.dart';
import 'package:projet_solid_r/pages/user/templates/SignupButton.dart';

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
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child:
                    Stack(children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/exampleSport.png',
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            AutoSizeText("Avancons ensemble vers un sport +\n", style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.end,),
                            AutoSizeText("inclusif\nresponsable\nsolidaire", style: TextStyle(fontSize: 15, color: Colors.yellow), textAlign: TextAlign.end,),
                          ],
                        ),
                      )
                    ]),
                  ),
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
                ],
              ),
            )
          )
        )
    );
  }
}
