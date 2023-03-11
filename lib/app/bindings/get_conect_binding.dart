import 'package:flutter_bike_finder/app/controllers/get_connect_controller.dart';
import 'package:get/get.dart';

class GetConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetConnectCoontroller());
  }
}