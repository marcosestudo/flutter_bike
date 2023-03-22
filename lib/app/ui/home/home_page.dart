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
  LatLng(-8.06133700000001, -34.871045),
  LatLng(-8.062496, -34.872956),
  LatLng(-8.0637776, -34.874296),
  LatLng(-8.06715100000001, -34.87577),
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
        body: FlutterMap(
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
              markers:
              locations.map((location) => (
                  Marker(
                    point: location,
                    width: 40,
                    height: 40,
                    builder: (context) {
                      return Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(locations.indexOf(location) == 0
                                ? "Eu"
                                : locations.indexOf(location).toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ));
                    },
                  ))
              ).toList())
          ],
        ));
  }
}
