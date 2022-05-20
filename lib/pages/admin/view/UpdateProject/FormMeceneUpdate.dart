import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/UpdatingProject/FormMultilineTextFieldWithContent.dart';

import 'package:projet_solid_r/pages/admin/view/Templates/UpdatingProject/FormTextFieldWithContentAdmin.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../Templates/AddingProject/FormMultilineTextField.dart';
import '../Templates/AddingProject/CarousselPictures.dart';

class FormMeceneUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormMeceneUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormMeceneUpdateState createState() => _FormMeceneUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormMeceneUpdateState extends State<FormMeceneUpdate> with AutomaticKeepAliveClientMixin<FormMeceneUpdate>{
  bool alreadyExist = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                  FormTextFieldWithContentAdmin(
                    key: widget.key,
                    inputType: TextInputType.text,
                    errorMessage: "Champ vide",
                    labelHint: "Entrez le nom du mécène",
                    label: "Nom",
                    text: widget.project.getEntityProject().entityName,
                  ),
                  FormMultilineTextFieldWithContent(
                      key: widget.key,
                      errorMessage: "Champ vide",
                      labelHint: "Entrez la description du mécène",
                      label: "Description",
                    text: widget.project.projectEntity.entityDescription,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text("Images"),
                        padding: const EdgeInsets.only(right:20.0, left:20.0, top: 20),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              alreadyExist = false;
                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                          child: const Text(
                            "Ajouter une photo",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: const EdgeInsets.only(right:20.0, left:20.0),
                      ),
                      const CarouselPictures(),
                    ],
                  ),
                ],
              )
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}