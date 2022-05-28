class DonationModel {
  late int donationID;
  late DateTime donationDate;
  late double sumOfDonation;
  late int userID;
  late int projectID;

  DonationModel(int donationID, DateTime donationDate, double sumOfDonation, int userID, int projectID) {
    setDonationID(donationID);
    setDonationDate(donationDate);
    setSumOfDonation(sumOfDonation);
    setUserID(userID);
    setProjectID(projectID);
  }

  DonationModel.fromJson(Map<dynamic, dynamic> json)
      : donationID = int.parse(json['donationID'] as String),
        donationDate = DateTime.parse(json['donationDate'] as String),
        sumOfDonation = double.parse(json['sumOfDonation'] as String),
        userID = int.parse(json['userID'] as String),
        projectID = int.parse(json['projectID'] as String);

  Map<dynamic, dynamic> toJson() =>
      <dynamic, dynamic>{
        'donationID': donationID.toString(),
        'donationDate': donationDate.toString(),
        'sumOfDonation': sumOfDonation.toString(),
        'userID': userID.toString(),
        'projectID': projectID.toString(),
      };

/****** Getters and Setters *****/

  setDonationID(int id){
  donationID=id;
  }
  int getDonationID(){
  return donationID;
  }
  setDonationDate(DateTime d){
    donationDate=d;
  }
  DateTime getDonationDate(){
   return donationDate;
  }
  setSumOfDonation(double sum){
  sumOfDonation=sum;
  }
  double getSumOfDonation(){
   return sumOfDonation;
  }
  setUserID(int idU){
  userID =idU;
  }
  int getUserID(){
  return userID;
  }
  setProjectID(int idP){
  projectID=idP;
  }
  int getProjectID(){
    return projectID;
  }

}