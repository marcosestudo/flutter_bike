import 'package:flutter_bike_finder/app/ui/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages{

  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),

  ];
}