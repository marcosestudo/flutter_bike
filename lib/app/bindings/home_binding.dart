import 'package:flutter_bike_finder/app/controllers/home_controller.dart';
import 'package:flutter_bike_finder/app/data/providers/api.dart';
import 'package:flutter_bike_finder/app/data/repository/map_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(mapRepository: MapRepository(apiClient: BikeLocalizationApiClient(httpClient: http.Client()))));
  }
}