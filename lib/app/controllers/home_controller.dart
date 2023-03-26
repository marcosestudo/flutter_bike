import 'package:flutter/cupertino.dart';
import 'package:flutter_bike_finder/app/data/repository/map_repository.dart';

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

  final Distance distance = Distance();
  void orderByDystance(List locationsList, dynamic myLocation) {
    locationsList.map((location) => (
      location["distancia"] = distance.as(
          LengthUnit.Meter,
          LatLng(location['latitude'],location['longitude']),
          LatLng(myLocation['latitude'], myLocation['longitude'])
      ))).toList();
    int n = locationsList.length;
    bool trocou;
    do {
      trocou = false;
      for (int i = 0; i < n - 1; i++) {
        if (locationsList[i]['distancia'] > locationsList[i + 1]['distancia']) {
          dynamic temp = locationsList[i];
          locationsList[i] = locationsList[i + 1];
          locationsList[i + 1] = temp;
          trocou = true;
        }
      }
      n--;
    } while (trocou);
    // debugPrint(locationsList.toString());
  }
}