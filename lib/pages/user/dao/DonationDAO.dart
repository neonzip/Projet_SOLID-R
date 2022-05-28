import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import '../model/DonationModel.dart';
import '../controller/Database.dart';

class DonationDAO {
  late DatabaseReference _DonationRef = FirebaseDatabase.instance.ref().child('Donation');
  DataBase db = DataBase();

  DonationDAO(){
    _DonationRef = db.db.ref().child('Donation');
  }

  Future<void> saveDonation(DonationModel donation) async {
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

  Future<Map<String, Double>> nbOfUsersDonatedToEachProject(int month) async {
    Map<String, Double> map = Map<String, Double>();

    DonationModel donationOBJ;
    final donationSnapshot = await FirebaseDatabase.instance.ref().child('Donation').get();
    donationSnapshot.children.forEach((donation)=> {
      donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>),
      if(donationOBJ.donationDate.month == month){
        /*
        body
         */
      }
    });

    return map;
  }

  Future<Map<String, Double>> sumOfDonationsToEachMonth() async {
    Map<String, Double> resultmap = Map<String, Double>();

    Map<int, Double> tempmap = Map<int, Double>();
    DonationModel donationOBJ;
    final donationSnapshot = await FirebaseDatabase.instance.ref().child('Donation').get();
    int key;
    donationSnapshot.children.forEach((donation)=> {
      donationOBJ = DonationModel.fromJson(donation.value as Map<dynamic, dynamic>),
        key = donationOBJ.getDonationDate().month,
        if(!tempmap.containsKey(key)){
          //..//
        }
        /*
        body
         */

    });
    return resultmap;
  }
}
