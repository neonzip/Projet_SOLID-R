import 'package:firebase_database/firebase_database.dart';
class DataBase{
  FirebaseDatabase db = FirebaseDatabase.instance;
  DataBase()
  {
    db.databaseURL = "https://sport-solid-r-test-default-rtdb.europe-west1.firebasedatabase.app/";
  }

  void GetData()
  {
    DatabaseReference ref = db.ref();
    ref = db.ref("profile");
    ref.once().then((DatabaseEvent event){
      print(event.snapshot.value);
    });
  }

  void SetData()
  {
    DatabaseReference ref = db.ref();
    ref.child("UserSettings").child("id").set(4);
  }
}
