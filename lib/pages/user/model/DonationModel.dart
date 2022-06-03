class DonationModel {
  late String donationID  ;
  late DateTime donationDate;
  late double sumOfDonation;
  late String userID;
  late String projectID;

  DonationModel(String donationID,DateTime donationDate, double sumOfDonation, String userID, String projectID) {
    setDonationID(donationID);
    setDonationDate(donationDate);
    setSumOfDonation(sumOfDonation);
    setUserID(userID);
    setProjectID(projectID);
  }

  DonationModel.fromJson(Map<dynamic, dynamic> json)
      : donationID = json['donationID'] as String,
        donationDate = DateTime.parse(json['donationDate'] as String),
        sumOfDonation = double.parse(json['sumOfDonation'] as String),
        userID = json['userID'] as String,
        projectID = json['projectID'] as String;

  Map<dynamic, dynamic> toJson() =>
      <dynamic, dynamic>{
        'donationID': donationID.toString(),
        'donationDate': donationDate.toString(),
        'sumOfDonation': sumOfDonation.toString(),
        'userID': userID.toString(),
        'projectID': projectID.toString(),
      };

/****** Getters and Setters *****/

  setDonationID(String id){
  donationID=id;
  }
  String getDonationID(){
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
  setUserID(String idU){
  userID =idU;
  }
  String getUserID(){
  return userID;
  }
  setProjectID(String idP){
  projectID=idP;
  }
  String getProjectID(){
    return projectID;
  }

}