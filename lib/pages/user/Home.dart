import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/templates/Separator.dart';
import 'package:projet_solid_r/pages/user/templates/YellowBubbleDonations.dart';
import 'package:projet_solid_r/pages/user/templates/YellowBubbleKilometers.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: const TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(
                    icon: Icon(FontAwesomeIcons.chartPie)
                ),
                Tab(
                    icon: Icon(FontAwesomeIcons.chartLine)
                ),
              ],
            ),
            title: Text('Flutter Charts'),
          ),
          body: const TabBarView(
            children: [],
          ),
        ),
      ),
    );
  }
}
