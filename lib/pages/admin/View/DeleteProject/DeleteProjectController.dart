import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/user/model/ProjectModel.dart';

import '../../../user/view/templates/MessageSnackbar.dart';

/// Widget view which builds the entire widget for the dialog of forgotten password.
class DeleteProjectController extends StatefulWidget {
  final ProjectModel project;
  const DeleteProjectController({Key? key, required this.project}) : super(key: key);

  @override
  _DeleteProjectControllerState createState() => _DeleteProjectControllerState();
}

class _DeleteProjectControllerState extends State<DeleteProjectController> {

  late TextEditingController textEditingControllerMailForPassword;

  @override
  void initState() {
    super.initState();
  }

  /// Build of the widget, of the dialog
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Text(
                  "Êtes-vous sûr de vouloir supprimer ce projet ?"
              ),
            ),
            Row (
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Delete project in the DB
                        deleteProject();

                        // Close the dialog window
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      });
                    },
                    style: //ButtonStyle
                    ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      side: const BorderSide(
                        width: 0.5,
                        color: Colors.yellow,
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(
                      "Oui",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child:
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                      });
                    },
                    style: //ButtonStyle
                    ElevatedButton.styleFrom(
                      primary: const Color(0xFF0725A5),
                      side: const BorderSide(
                        width: 0.5,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(
                      "Non",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }

  /// Called when the user pressed the button Oui.
  /// Delete the project in the DB.
  void deleteProject() {
    // TODO : Delete the specific project.
    print("Project ID for deleting :" + widget.project.projectID.toString());

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(5),
          backgroundColor: Colors.white,
          shape: Border(
            bottom: BorderSide(color: Colors.yellow),
          ),
          content: MessageSnackbar(
            title: 'Suppression réalisée\n',
            text: "Le projet a bien été suprimé.",
          ),
          duration: Duration(seconds: 5),
        )
    );
  }
}
