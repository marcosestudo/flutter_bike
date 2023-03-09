import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: true,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
  ));
}