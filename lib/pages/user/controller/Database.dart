import 'package:firebase_database/firebase_database.dart';
class DataBase{
  FirebaseDatabase db = FirebaseDatabase.instance;
  DataBase()
  {
    db.databaseURL = "https://sport-solid-r-test-default-rtdb.europe-west1.firebasedatabase.app";
  }

  void GetData(String Path)
  {
    DatabaseReference ref = db.ref();
    ref = db.ref(Path);
    ref.once().then((DatabaseEvent event){
      print(event.snapshot.value);
    });
  }

  void SetData(String Path, Object value)
  {
    DatabaseReference ref = db.ref();
    ref = db.ref(Path);
    ref.set(value);
  }
}
