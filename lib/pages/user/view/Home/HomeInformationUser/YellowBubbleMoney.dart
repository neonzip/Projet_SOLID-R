import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/UserModel.dart';
import 'package:projet_solid_r/pages/user/view/Project/SomeProjects/FormalProjects/FormalProjects.dart';

class YellowBubbleMoney extends StatefulWidget {
  final UserModel user;

  const YellowBubbleMoney({Key? key, required this.user}) : super(key: key);
  @override
  _YellowBubbleMoneyState createState() => _YellowBubbleMoneyState();
}

class _YellowBubbleMoneyState extends State<YellowBubbleMoney> {
  @override
  Widget build(BuildContext context) {
    return yellowBubbleMoney();
  }


  /// Yellow bubble containing the money that the user have and that he can give to a project.
  Widget yellowBubbleMoney() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> FormalProjects(user: widget.user)));
        },
        child: Container(
          child:
          Column(
            children: [
              const Text(
                  "Cagnotte :",
                  style: TextStyle(fontSize: 20)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      widget.user.userPurse.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold)
                  ),

                  const Text(
                      " €",
                      style: TextStyle(fontSize: 20)
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10), //border corner radius
            boxShadow:[
              BoxShadow(
                color: Colors.black.withOpacity(0.6), //color of shadow
                blurRadius: 3, // blur radius
                offset: const Offset(0, 1), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
            ],
          ),
          padding: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
          margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
        )
    );
  }
}