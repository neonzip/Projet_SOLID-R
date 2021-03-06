import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/view/Templates/FormTextFieldAdmin.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import '../../../DAO/AssociationDAO.dart';
import '../../../MODEL/AssociationModel.dart';
import '../../../user/view/templates/ProgressIndicatorAsync.dart';
import '../Templates/FormMultilineTextField.dart';
import '../Templates/CarousselPictures.dart';

class FormAssociation extends StatefulWidget {
  final PageController controller;

  final ProjectModel project;

  const FormAssociation({Key? key, required this.project, required this.controller}) : super(key: key);

  @override
  _FormAssociationState createState() => _FormAssociationState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormAssociationState extends State<FormAssociation> with AutomaticKeepAliveClientMixin<FormAssociation> {

  // List in the dropdown list in the database
  var items = ["Aucune"];

  // string for next selected value in the dropdown list
  String? _dropdownValue = "";

  // string of the current association chosen
  String? currentAssociation;

  bool alreadyExist = true;

  String errorMessageNameAssociation = "Veuillez entrer le nom de l'association.";
  String errorMessageMailAssociation = "Veuillez entrer le courriel de l'association.";

  late TextEditingController textEditingControllerNameAssociation;
  late TextEditingController textEditingControllerMailAssociation;
  late TextEditingController textEditingControllerDescriptionAssociation;

  @override
  void initState() {
    textEditingControllerNameAssociation = TextEditingController();
    textEditingControllerNameAssociation.addListener(() {
      onChangedName();
    });

    textEditingControllerMailAssociation = TextEditingController();
    textEditingControllerMailAssociation.addListener(() {
      onChangedMail();
    });

    textEditingControllerDescriptionAssociation = TextEditingController();
    textEditingControllerMailAssociation.addListener(() {
      onChangedDescription();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBF1FF),
        body: SingleChildScrollView(
          child: Center(
              child: Visibility(
                  child: (alreadyExist == false) ?
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("L'association existe d??j?? ?"),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    alreadyExist = true;
                                  });
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "S??lectionner une association",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                      ),
                      FormTextFieldAdmin(
                        key: widget.key,
                        inputType: TextInputType.text,
                        errorMessage: errorMessageNameAssociation,
                        labelHint: "Entrez le nom de l'association",
                        label: "Nom",
                        textEditingController: textEditingControllerNameAssociation,
                      ),
                      FormMultilineTextField(
                        key: widget.key,
                        errorMessage: "",
                        labelHint: "Entrez la description de l'association",
                        label: "Description",
                        textEditingController: textEditingControllerDescriptionAssociation,
                      ),
                      FormTextFieldAdmin(
                        key: widget.key,
                        inputType: TextInputType.text,
                        errorMessage: errorMessageMailAssociation,
                        labelHint: "Entrez le courriel de l'association",
                        label: "Courriel",
                        textEditingController: textEditingControllerMailAssociation,
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
                                "Ajouter un logo",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            padding: const EdgeInsets.only(right:20.0, left:20.0),
                          ),
                          Padding(
                            child: Image.asset('assets/logo_solid_R.png'),
                            padding: const EdgeInsets.only(left:20, right:20, bottom: 20),
                          ),
                        ],
                      )
                    ],
                  )
                      :

                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text("Association", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("S??lectionnez une association existante :"),
                              dropDownAssociations(),
                            ],
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("L'association n'existe pas encore ?"),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    alreadyExist = false;
                                  });
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "Ajouter une association",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )

              )
          ),
        )
    );
  }



  void onChangedMail() {
    // TODO: Implement the rest of this method in order to change the error message when the admin does not put a right email.
    // TODO: Change the message when the email does not exist.

    /// We get the last modified value of the email text field and create a specific variable to use it.
    String email = textEditingControllerMailAssociation.text;

    // The email is empty
    if (email.isEmpty) {
      errorMessageMailAssociation = "Veuillez entrer le courriel de l'association.";
    }
    // The email is correct
    else {
      errorMessageMailAssociation = "";
    }
    setState(() {
      widget.project.projectAssociation.associationMail = email;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerNameAssociation.text;

    // The name is empty
    if (name.isEmpty) {
      errorMessageNameAssociation = "Veuillez entrer le nom de l'association.";
    }
    // The name is correct
    else {
      errorMessageNameAssociation = "";
    }
    setState(() {
      widget.project.projectAssociation.entityName = name;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    widget.project.projectAssociation.entityDescription = textEditingControllerDescriptionAssociation.text;
  }

  /// Widget which builds the dropdown with the list of associations.
  Widget dropDownAssociations() {
    return FutureBuilder<List<AssociationModel>>(
        future: AssociationDAO().getListOfAssociations(),
        builder: (BuildContext context,
            AsyncSnapshot<List<AssociationModel>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressIndicatorAsync();
          }
          else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print("snap = " + snapshot.data.toString());
              }
              return Text('Erreur. ' + snapshot.error.toString());
            } else if (snapshot.hasData) {
              items = ["Aucune"];
              snapshot.data?.forEach((element) {
                items.add(element.entityName);
              });
              return Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0))
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    isExpanded: true,
                    value: items.elementAt(0),
                    focusColor: Colors.yellow,
                    hint: const Text("Choisir une association"),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: dropDownCallback,
                  ),
                ),
              );
            } else {
              return const Text('Aucune donn??e');
            }
          } else {
            return Text("Etat : ${snapshot.connectionState}");
          }
        }
    );
  }

  /// Called when a new item in the list is selected.
  void dropDownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
        var itemSelected = selectedValue;
        items.remove(itemSelected);
        items.insert(0, itemSelected);
        currentAssociation = selectedValue;
      }
      );
    }
  }

  /// Builds the menu inside the dropdown
  /// And sets the first element of the container to the value selected previously.
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
            item,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}