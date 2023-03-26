import 'package:flutter/cupertino.dart';
import 'package:flutter_bike_finder/app/data/repository/map_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  final MapRepository? mapRepository;

  HomeController({@required this.mapRepository}) : assert(mapRepository != null);

  List<dynamic> locations = [];
  dynamic myLocation = {};
  bool isLoading = true;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() {
    mapRepository?.getLocation().then((deviceLocation) {
      myLocation = deviceLocation;
      mapRepository?.getAll().then((locationsList) {
        locations = locationsList;
        orderByDystance(locations, myLocation);
        isLoading = false;
        update();
      });
    });

  }

  void orderByDystance(List locationsList, dynamic myLocation) {
    dynamic distancias = locationsList.map((location) => (
      Geolocator.distanceBetween(
          location['latitude'],
          location['longitude'],
          myLocation['latitude'],
          myLocation['longitude']
      ))).toList();
    debugPrint("----- CHEPOINT 1 ---------- CHEPOINT 1 ---------- CHEPOINT 1 ---------- CHEPOINT 1 ---------- CHEPOINT 1 ---------- CHEPOINT 1 -----");

    int n = distancias.length;
    bool trocou;
    debugPrint("----- CHEPOINT 2 ---------- CHEPOINT 2 ---------- CHEPOINT 2 ---------- CHEPOINT 2 ---------- CHEPOINT 2 ---------- CHEPOINT 2 -----");
    do {
      trocou = false;
      for (int i = 0; i < n - 1; i++) {
        if (distancias[i] > distancias[i + 1]) {
          dynamic tempDist = distancias[i];
          distancias[i] = distancias[i + 1];
          distancias[i + 1] = tempDist;
          dynamic tempLoc = locationsList[i];
          locationsList[i] = locationsList[i + 1];
          locationsList[i + 1] = tempLoc;
          trocou = true;
        }
      }
      n--;
    } while (trocou);
    debugPrint(locationsList.toString());
  }
}