import 'package:flutter/cupertino.dart';
import 'package:flutter_bike_finder/app/data/repository/map_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MapRepository? mapRepository;

  HomeController({@required this.mapRepository}) : assert(mapRepository != null);

}