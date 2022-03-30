import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

class MeceneInformation extends StatefulWidget {
  final ProjectModel project;

  const MeceneInformation({Key? key, required this.project}) : super(key: key);
  @override
  _MeceneInformationState createState() => _MeceneInformationState();
}

class _MeceneInformationState extends State<MeceneInformation> {
  @override
  Widget build(BuildContext context) {
    return meceneInformationTemplate();
  }

  /// Widgets which contains the part
  Widget meceneInformationTemplate() {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))
      ),
      padding: const EdgeInsets.all(5),
      child: Table(
        children: [
          TableRow(
              children: [
                Column(
                  children: [
                    const AutoSizeText("Proposé par :\n"),
                    Image.asset(
                      widget.project.projectAssociation.associationLogo,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: const Text("Financé par :"),
                    ),
                    AutoSizeText(
                      widget.project.projectEntity.entityName,
                      style: const TextStyle(fontWeight: FontWeight.bold,),
                    )
                  ],
                )
              ]
          )
        ],
      ),
    );
  }
}