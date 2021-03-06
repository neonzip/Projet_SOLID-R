import 'package:flutter/material.dart';
import 'package:projet_solid_r/pages/admin/view/UpdateProject/FormAssociationUpdate.dart';
import 'package:projet_solid_r/pages/admin/view/UpdateProject/FormConfirmationUpdate.dart';
import 'package:projet_solid_r/pages/admin/view/UpdateProject/FormMeceneUpdate.dart';
import 'package:projet_solid_r/pages/admin/view/UpdateProject/FormProjectUpdate.dart';
import 'package:projet_solid_r/pages/MODEL/ProjectModel.dart';

class UpdatingProject extends StatefulWidget {
  final ProjectModel project;
  const UpdatingProject({Key? key, required this.project}) : super(key: key);

  @override
  _UpdatingProjectState createState() => _UpdatingProjectState();
}

class _UpdatingProjectState extends State<UpdatingProject> {
  late ProjectModel projectData;

  /// List of the page for adding new project.
  /// One for the project
  /// Another for the association
  /// An other one for the mecene
  /// The last to confirm changes
  /// https://www.woolha.com/tutorials/flutter-creating-pageview-with-pagecontroller-examples#:~:text=In%20Flutter%2C%20PageView%20is%20a%20scrollable%20list%20that,%28pages%29%2C%20the%20user%20needs%20to%20scroll%20the%20list.
  /// https://medium.com/aubergine-solutions/create-an-onboarding-page-indicator-in-3-minutes-in-flutter-a2bd97ceeaff
  late final List<Widget> pages;



  /// Page controller
  static final controller = PageController(
    initialPage: 0, // First page by default
  );

  int currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0725A5),
          title: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Modification projet",
                  textAlign: TextAlign.left,
                ),
                const Text(""),Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/admin/profile");
                        },
                        child: Column(
                          children: const [
                            Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white),
                            Text(
                                "Profil",
                                style: TextStyle(color:Colors.white))
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),

        //////////////////////////////////////////////////////
        //////////////////////////////////////////////////////
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: pages.length,
              onPageChanged: (int page) {
                getChangedPageAndMoveBar(page);
              },
              controller: controller,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ],
        ),
        /* Menu at the bottom with the 2 other buttons "Projets" and "Favoris". */
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Table(
            children: [
              TableRow(
                children: [
                  Visibility(
                    visible: currentPageValue != 0
                        ? true
                        : false,
                    child: TextButton(
                      onPressed: () {
                        currentPageValue --;
                        controller.jumpToPage(currentPageValue);
                      },
                      child: const Text("< Pr??c??dent", style: TextStyle(color: Color(0xFF0725A5), fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < pages.length; i++)
                              if (i == currentPageValue) ...[circleBar(true)] else
                                circleBar(false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  (currentPageValue != pages.length - 1) ? TextButton(
                    onPressed: () {
                      currentPageValue ++;
                      controller.jumpToPage(currentPageValue);
                    },
                    child: const Text("Suivant >", style: TextStyle(color: Color(0xFF0725A5), fontWeight: FontWeight.bold),),
                  )
                  :
                  TextButton(
                    onPressed: () {
                      showAbandon();
                    },
                    child: const Text("Annuler", style: TextStyle(color: Color(0xFF0725A5), fontWeight: FontWeight.bold),),
                  ),
                ]
              )
            ],
          ),
        )
    );
  }


  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0725A5) : const Color(0x250725A5),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  @override
  void initState() {
    projectData = widget.project;

    pages = [

      // Page for project information
      FormProjectUpdate(project: projectData),

      // Page for association information
      FormAssociationUpdate(project: projectData),

      // Page for mecene information
      FormMeceneUpdate(project: projectData),

      // Page for confirmation
      FormConfirmationUpdate(project: projectData),
    ];
    super.initState();
  }


  void showAbandon() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Container(
              alignment: Alignment.center,
              child: const Text(
                "??tes-vous s??r de vouloir tout abandonner ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            content: SingleChildScrollView(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 50),
                  child:Text(
                    "Les modifications ne seront pas apport??es.",
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Oui",
                            style: TextStyle(
                              color: Color(0xFF0725A5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:const Color(0xFF0725A5),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            },
                            child: const Text(
                            "Non",
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}