import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Container(
            padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 25,
                    child: Image(
                        alignment: Alignment.centerLeft,
                        image: AssetImage("assets/logo_solid_R.png")
                    ),
                  ),
                  Expanded(
                    flex: 80,
                    child: Center(
                      child: Text("Menu Principal"),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/profile");
                        },
                        child: Column(
                          children: [
                            Icon(Icons.accessibility),
                            Text("Profil")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
      ),
      body: SafeArea (
          child: Column(
            children: [
              Expanded(
                flex: 70,
                child: Container(
                  color: Colors.grey[600],
                ),
              ),
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Column(

                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Column(
                        children: [
                          Expanded(
                            child: RaisedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, "/projects");
                              },
                              icon: Icon(Icons.library_books_outlined),
                              label: Text("Projets"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
