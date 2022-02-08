import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {


  Widget Projects_Template(){
    return Card(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.blue[400],
                child: Text("Nom projet, Etc..."),
              )
            ),
            Expanded(
              flex: 20,
              child: Text("ici, les participation et tout"),
            ),
            Expanded(
              flex: 75,
              child: Text("Description projet et tout"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Row(
          children: const [
            Expanded(
              flex: 15,
              child: SizedBox(
                width: 15,
              ),
            ),
            Expanded(
              flex: 70,
              child: Center(
                  child: Text("Projets"),
                ),
            ),
            Expanded(
              flex: 15,
              child: Image(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assets/logo_solid_R.png")
              ),
            ),

          ],
        )
      ),
      body: SafeArea(
        child: Projects_Template(),
      ),
    );
  }
}
