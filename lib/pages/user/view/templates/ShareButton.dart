import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// Link for sharing datas in another app : https://www.codewithflutter.com/flutter-share-data-to-another-application/#:~:text=%20Flutter%20Share%20Data%20to%20Another%20Application%20,a%20simple%20example.%20If%20you%20are...%20More%20
class ShareButton extends StatefulWidget {
  final double valueDonation;     // Value of the current donation
  final String nomProjet;


  const ShareButton({Key? key, required this.valueDonation, required this.nomProjet}) : super(key: key);
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buttonShare();
  }

  void shareDonation() {
    Share.share("Sport SOLID'R :\nJe viens de faire un don de " + widget.valueDonation.toString() + " euros pour le projet " + widget.nomProjet + " !\n\nTélécharge toi aussi l'application Sport SOLID'R et pratique une activité physique engagée !\n\n\nDisponible sur Google Play et Apple Store.", subject: "DON EFFECTUÉ");
  }


  /// Button to share a donation.
  /// Called "Partager".
  Widget buttonShare() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:
        SizedBox(
          child:
          ElevatedButton.icon(
            onPressed: () {
              shareDonation();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF0725A5)),
              elevation: MaterialStateProperty.all<double?>(0.0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            label: const Text(
              "Partager",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.share, color: Colors.white),
          ),
        )
    );
  }
}