import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/controllers/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

// note que no terceiro import não se coloca a pasta lib, já vai direto pra pasta app

// extends StatelessWidget trocado por extends GetView
// GetView é um StatelessWidget com o controlador já instanciado
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("🚧 Trabalhando... 🚧 (｡•́‿•̀｡)"),
          centerTitle: true,  
          ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(51.509364, -0.128928),
          zoom: 9.2,
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      )
    );
  }
}