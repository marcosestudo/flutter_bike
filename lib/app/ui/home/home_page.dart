import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/controllers/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

// note que no terceiro import não se coloca a pasta lib, já vai direto pra pasta app

// extends StatelessWidget trocado por extends GetView
// GetView é um StatelessWidget com o controlador já instanciado

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🚧 Work in progress... 🚧"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                center: controller.locations[1],
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
                  markers: controller.locations.map((location) => (
                    Marker(
                      point: LatLng(location['latitude'], location['longitude']),
                      width: 40,
                      height: 40,
                      builder: (context) {
                        return Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              controller.locations.indexOf(location) == 0
                                  ? "Eu"
                                  : controller.locations.indexOf(location).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          ));
                      },
                    )))
                .toList())
              ],
            );
      }));
  }
}
