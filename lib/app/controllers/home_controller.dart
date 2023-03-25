import 'package:flutter/cupertino.dart';
import 'package:flutter_bike_finder/app/data/repository/map_repository.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  final MapRepository? mapRepository;

  HomeController({@required this.mapRepository}) : assert(mapRepository != null);

  List<dynamic> locations = [];
  bool isLoading = true;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() {
    mapRepository?.getAll().then((value) {
      locations = value;
      isLoading = false;
      update();
    });
  }

  // TODO: usar localização do dispositivo

  // final locations = [
  //   LatLng(-8.055353, -34.871916),
  //   LatLng(-8.058764, -34.872428),
  //   LatLng(-8.06133700000001, -34.871045),
  //   LatLng(-8.062496, -34.872956),
  //   LatLng(-8.0637776, -34.874296),
  //   LatLng(-8.06715100000001, -34.87577),
  // ];

}