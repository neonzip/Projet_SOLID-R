import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import '../model/DonationModel.dart';
import '../controller/Database.dart';
import '../model/ProjectModel.dart';

class DonationDAO {
  late DatabaseReference _DonationRef = FirebaseDatabase.instance.ref().child('Donation');
  DataBase db = DataBase();

  DonationDAO(){
    _DonationRef = db.db.ref().child('Donation');
  }

  Future<void> saveDonation(DonationModel donation) async {
    var datasnapshot = await db.db.ref().child('Donation').get();
    //donation.donationID = datasnapshot.children.length+1;
    _DonationRef = db.db.ref().child('Donation/'+donation.getDonationID().toString());
    await _DonationRef.set(donation.toJson());
    // another way that works
    //_SportRef.push().set(sport.toJson());
  }

  Query getDonationQuery() {
    return _DonationRef;
  }

  Future<DonationModel> getDonationByID(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final donationSnapshot = await ref.child('Donation/'+ id.toString()).get();
    final json = donationSnapshot.value as Map<dynamic, dynamic>;
    final donationOBJ = DonationModel.fromJson(json);
    return donationOBJ;
  }

  deleteById(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    await ref.child('Donation/'+ id.toString()).remove();
  }

  Future<List<DonationModel>> getListOfDonations() async {

    List<DonationModel> list = <DonationModel>[];

    final ref = FirebaseDatabase.instance.ref();
    DonationModel donationOBJ;

    final donationSnapshot = await ref.child('Donation').get();
    donationSnapshot.children.forEach((donation)=> {
      donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>),
      list.add(donationOBJ),
    });

    print(" list of Donations ");
    list.forEach((e) { print("  " + e.sumOfDonation.toString()); });

    return list;
  }

  Future<Map<String, double>> nbOfUsersDonatedToEachProject(int month) async {

    Map<String, double> resultmap = Map<String, double>();
    Map<int, double> tempmap = Map<int, double>();
    DonationModel donationOBJ;
    int idProject;
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
    projectDataSnapshot.children.forEach((project) {
      projectObj = ProjectModel.fromJson(project.value as Map<dynamic, dynamic>);
      int id = projectObj.getIdProject();
    if(tempmap.containsKey(id)){
      resultmap[projectObj.getNameProject()]= tempmap[id]!;
    }
    });

   resultmap.forEach((key, value) {print("result map of number of users donated to each project :"+ key + " : " + value.toString() + '\n');});
    return resultmap;
  }

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
    resultmap.forEach((key, value) {print("result map of sum of donations each month :"+ key + " : " + value.toString() + '\n');});
    return resultmap;
    return resultmap;
  }
}
