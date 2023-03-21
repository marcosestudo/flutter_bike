import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/controllers/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

// note que no terceiro import não se coloca a pasta lib, já vai direto pra pasta app

// extends StatelessWidget trocado por extends GetView
// GetView é um StatelessWidget com o controlador já instanciado

final locations = [
  LatLng(-8.055353, -34.871916),
  LatLng(-8.058764, -34.872428),
];

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("🚧 Work in progress... 🚧"),
          centerTitle: true,  
          ),
      body:
      FlutterMap(
        options: MapOptions(
          center: LatLng(-8.055353, -34.871916),
          zoom: 15, // zoom máximo = 18
          minZoom: 3.0,
          maxZoom: 18.0,
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
          MarkerLayer(
            markers: [
              Marker(
                point: locations[0],
                width: 30,
                height: 30,
                builder: (context) => const FlutterLogo(),
              ),
              Marker(
                point: locations[1],
                width: 30,
                height: 30,
                builder: (context) => const FlutterLogo(),
              ),
            ],
          ),
        ],
      )









    );
  }
}