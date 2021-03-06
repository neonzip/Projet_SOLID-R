import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:projet_solid_r/pages/admin/view/Templates/FormTextFieldAdmin.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';
import '../../../DAO/EntityDAO.dart';
import '../../../MODEL/EntityModel.dart';
import '../../../user/view/templates/ProgressIndicatorAsync.dart';
import '../Templates/FormMultilineTextField.dart';
import '../Templates/CarousselPictures.dart';

class FormMecene extends StatefulWidget {
  final PageController controller;

  final ProjectModel project;

  const FormMecene({Key? key, required this.controller, required this.project}) : super(key: key);

  @override
  _FormMeceneState createState() => _FormMeceneState();
}

/// https://stackoverflow.com/questions/45944777/losing-widget-state-when-switching-pages-in-a-flutter-pageview
class _FormMeceneState extends State<FormMecene> with AutomaticKeepAliveClientMixin<FormMecene>{

  var items = ["Aucun"];// = DataEntityTest().getEntityDataList();

  // string for next selected value in the dropdown list
  String? _dropdownValue;

  // string of the current entity chosen
  String? currentEntity;

  bool alreadyExist = true;

  late TextEditingController textEditingControllerDescriptionMecene;
  late TextEditingController textEditingControllerNameMecene;

  String errorMessageNameMecene = "Veuillez entrer le nom du mécène.";

  @override
  void initState() {
    textEditingControllerNameMecene = TextEditingController();
    textEditingControllerNameMecene.addListener(() {
      onChangedName();
    });

    textEditingControllerDescriptionMecene = TextEditingController();
    textEditingControllerDescriptionMecene.addListener(() {
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
                  child: (alreadyExist == false) ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Le mécène existe déjà ?"),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    alreadyExist = true;
                                  });
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "Sélectionner un mécène",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                      ),
                      FormTextFieldAdmin(
                        key: widget.key,
                        inputType: TextInputType.text,
                        errorMessage: errorMessageNameMecene,
                        labelHint: "Entrez le nom du mécène",
                        label: "Nom",
                        textEditingController: textEditingControllerNameMecene,
                      ),
                      FormMultilineTextField(
                        key: widget.key,
                        errorMessage: "",
                        labelHint: "Entrez la description du mécène",
                        label: "Description",
                        textEditingController: textEditingControllerDescriptionMecene,
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
                      :
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text("Mécène", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Sélectionnez un mécène existant :"),
                              dropDownMecenes(),
                            ],
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Le mécène n'existe pas encore ?"),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    alreadyExist = false;
                                  });
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5))),
                                child: const Text(
                                  "Ajouter un mécène",
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

  void onChangedName() {
    /// We get the last modified value of the name text field and create a specific variable to use it.
    String name = textEditingControllerNameMecene.text;


    // The name is empty
    if (name.isEmpty) {
      errorMessageNameMecene = "Veuillez entrer le nom du mécène.";
    }
    // The name is correct
    else {
      errorMessageNameMecene = "";
    }
    setState(() {
      widget.project.projectEntity.entityName = name;
      // It updates the widget in order to load the error message changes in this case
    });
  }

  void onChangedDescription() {
    widget.project.projectEntity.entityDescription = textEditingControllerDescriptionMecene.text;
  }

  /// Widget which builds the dropdown with the list of entities.
  Widget dropDownMecenes() {
    return FutureBuilder<List<EntityModel>>(
        future: EntityDAO().getListOfEntities(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<EntityModel>> snapshot,
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
              items = ["Aucun"];
              snapshot.data?.forEach((element) {
                items.add(element.entityName);
              });
              return  Container(
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
                    hint: const Text("Choisir un mécène"),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: dropDownCallback,
                  ),
                ),
              );
            } else {
              return const Text('Aucune donnée');
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
        currentEntity = selectedValue;
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