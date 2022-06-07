import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import '../user/controller/Database.dart';
import '../MODEL/DonationModel.dart';
import '../MODEL/ProjectModel.dart';

class DonationDAO {
  late DatabaseReference donationRef = FirebaseDatabase.instance.ref().child('Donation');
  DataBase db = DataBase();

  DonationDAO(){
    donationRef = db.db.ref().child('Donation');
  }

  Future<void> saveDonation(DonationModel donation) async {
    // failed attempt to increment donation id automatically
    //var datasnapshot = await db.db.ref().child('Donation').get();
    //donation.donationID = datasnapshot.children.length+1;

    //this works but does not increment the id automatically
    donationRef = db.db.ref().child('Donation/'+donation.getDonationID().toString());
    await donationRef.set(donation.toJson());
  }

  Query getDonationQuery() {
    return donationRef;
  }

  /// Gets a donation with its ID.
  Future<DonationModel> getDonationByID(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    final donationSnapshot = await ref.child('Donation/'+ id.toString()).get();
    final json = donationSnapshot.value as Map<dynamic, dynamic>;
    final donationOBJ = DonationModel.fromJson(json);
    return donationOBJ;
  }

  /// Remove a donation in the database.
  deleteById(String id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Donation/'+ id.toString()).remove();
  }

  /// Add a donation to the database.
  addDonation(DonationModel donation) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference newRef = ref.child('Donation/').push();
    donation.donationID = newRef.key!;
    newRef.set(donation.toJson());
  }

  /// Gets the list of all donations.
  Future<List<DonationModel>> getListOfDonations() async {

    List<DonationModel> list = <DonationModel>[];

    final ref = FirebaseDatabase.instance.ref();
    DonationModel donationOBJ;

    final donationSnapshot = await ref.child('Donation').get();
    for (var donation in donationSnapshot.children) {
      {
        donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>);
        list.add(donationOBJ);
      }
    }
    return list;
  }

  /// Gets the number of donations during a month
  Future<Map<String, double>> nbOfUsersDonatedToEachProject(int month) async {

    Map<String, double> resultmap = Map<String, double>();
    Map<String, double> tempmap = Map<String, double>();
    DonationModel donationOBJ;
    String idProject;
    double? usersCount=0;
    final donationSnapshot = await FirebaseDatabase.instance.ref().child('Donation').get();
    donationSnapshot.children.forEach((donation)=> {
      donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>),
      if(donationOBJ.donationDate.month == month){
        idProject = donationOBJ.getProjectID(),
        if(!tempmap.containsKey(idProject)){
          tempmap[idProject]=1,
        }
        else{
        usersCount = tempmap[idProject],
        tempmap[idProject] = 1 + usersCount!,
        }
      }
    });
    // writing the tempmap into the result map;
    ProjectModel projectObj;
    var projectDataSnapshot = await FirebaseDatabase.instance.ref().child('Project').get();
    for (var project in projectDataSnapshot.children) {
      projectObj = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      String id = projectObj.getIdProject();
    if(tempmap.containsKey(id)){
      resultmap[projectObj.getNameProject()]= tempmap[id]!;
    }
    }

    // print the resultMap
   resultmap.forEach((key, value) {
     if (kDebugMode) {
       print("result map of number of users donated to each project :"+ key + " : " + value.toString() + '\n');
     }
   });

    return resultmap;
  }

  /// Gets the amount of donations for each months.
  Future<Map<String, double>> sumOfDonationsToEachMonth() async {
    Map<String, double> resultmap = Map<String, double>();
    // we will be using the tempmap to store data as it is easier
    Map<int, double> tempmap = Map<int, double>();
    DonationModel donationOBJ;
    final donationSnapshot = await FirebaseDatabase.instance.ref().child('Donation').get();
    int monthInt = 0;
    String monthStr ="";
    double? value = 0;
    double sumOfDonation = 0;

    donationSnapshot.children.forEach((donation)=> {
      donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>),
        monthInt = donationOBJ.getDonationDate().month,
        sumOfDonation = donationOBJ.getSumOfDonation(),

        if(!tempmap.containsKey(monthInt) ){
          tempmap[monthInt] = sumOfDonation,
        }
        else{
          value = tempmap[monthInt],
          tempmap[monthInt] = sumOfDonation + value!,
        }

    });
    // initializing the result map;
    switch (monthInt) {
        case 1 : value =  tempmap[1];
                 monthStr = "Janvier";
                 resultmap[monthStr] = value!;
                 break;
        case 2 :  value =  tempmap[2];
                  monthStr = "Février";
                  resultmap[monthStr] = value!;
                  break;
        case 3 :  value =  tempmap[3];
                  monthStr = "Mars";
                  resultmap[monthStr] = value!;
                  break;
        case 4 :  value =  tempmap[4];
                  monthStr = "Avril";
                  resultmap[monthStr] = value!;
                  break;
        case 5 :  value =  tempmap[5];
                  monthStr = "Mai";
                  resultmap[monthStr] = value!;
                  break;
        case 6 :  value =  tempmap[6];
                  monthStr = "Juin";
                  resultmap[monthStr] = value!;
                  break;
        case 7 :  value =  tempmap[7];
                  monthStr = "Juillet";
                  resultmap[monthStr] = value!;
                  break;
        case 8 :  value =  tempmap[8];
                  monthStr = "Aout";
                  resultmap[monthStr] = value!;
                  break;
        case 9 :  value =  tempmap[9];
                  monthStr = "Septembre";
                  resultmap[monthStr] = value!;
                  break;
        case 10 : value =  tempmap[10];
                  monthStr = "Octobre";
                  resultmap[monthStr] = value!;
                  break;
        case 11 : value =  tempmap[11];
                  monthStr = "Novembre";
                  resultmap[monthStr] = value!;
                  break;
        case 12 : value =  tempmap[10];
                  monthStr = "Décembre";
                  resultmap[monthStr] = value!;
                  break;
        default : monthStr ="unknown" ; break;
    }
    // print the resultMap
    resultmap.forEach((key, value) {
      if (kDebugMode) {
        print("result map of sum of donations each month :"+ key + " : " + value.toString() + '\n');
      }
    });
    return resultmap;
  }
}
