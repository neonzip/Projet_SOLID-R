import 'package:flutter/material.dart';
import 'package:location/location.dart';


class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  late Future<LocationData> currentLocation;
  late Location location;

  @override
  void initState() {
    super.initState();

    location = Location();
    currentLocation = location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("localisationTestJuju"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentLocation = location.getLocation();
            });
          },
          tooltip: 'Refresh',
          child: const Icon(Icons.refresh),
        ),
        body: FutureBuilder(
            future: currentLocation,
            builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.data!.latitude.toString() +
                          " - " +
                          snapshot.data!.longitude.toString()),
                    );
                  }
                default:
                  return const Text('');
              }
            })
    );/*Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0725A5),
        title: const Text("Projets favoris"),
        centerTitle: true,
      ),
      //body: ok(),
    );*/
  }
  }