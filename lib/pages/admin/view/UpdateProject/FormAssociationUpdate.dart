import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/Templates/UpdatingProject/FormMultilineTextFieldWithContent.dart';

import 'package:projet_solid_r/pages/admin/view/Templates/UpdatingProject/FormTextFieldWithContentAdmin.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';
import '../Templates/AddingProject/FormMultilineTextField.dart';
import '../Templates/AddingProject/CarousselPictures.dart';

class FormAssociationUpdate extends StatefulWidget {
  final ProjectModel project;
  const FormAssociationUpdate({Key? key, required this.project}) : super(key: key);

  @override
  _FormAssociationUpdateState createState() => _FormAssociationUpdateState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormAssociationUpdateState extends State<FormAssociationUpdate> with AutomaticKeepAliveClientMixin<FormAssociationUpdate> {
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
                    child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                  FormTextFieldWithContentAdmin(
                    key: widget.key,
                    inputType: TextInputType.text,
                    errorMessage: "Champ vide",
                    labelHint: "Entrez le nom de l'association",
                    label: "Nom",
                    text: widget.project.getProjectAssociation().entityName,
                  ),
                  FormMultilineTextFieldWithContent(
                      key: widget.key,
                      errorMessage: "Champ vide",
                      labelHint: "Entrez la description de l'association",
                      label: "Description",
                    text: widget.project.projectAssociation.entityDescription,
                  ),
                  FormTextFieldWithContentAdmin(
                    key: widget.key,
                    inputType: TextInputType.text,
                    errorMessage: "Champ vide",
                    labelHint: "Entrez le courriel de l'association",
                    label: "Courriel",
                    text: widget.project.projectAssociation.associationMail,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text("Logo"),
                        padding: const EdgeInsets.only(right:20.0, left:20.0, top: 20),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              alreadyExist = false;
                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                          child: const Text(
                            "Modifier le logo",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        padding: const EdgeInsets.only(right:20.0, left:20.0),
                      ),
                      Padding(
                        child: Image.asset(widget.project.projectAssociation.associationLogo),
                        padding: const EdgeInsets.only(left:20, right:20, bottom: 20),
                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}