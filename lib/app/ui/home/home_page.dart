import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/controllers/home_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bike "),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(builder: (_) {
        return controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                // cetralizei o mapa no início de uma forma que dê pra ver a nossa posição e as posições das bikes ao mesmo tempo
                center: LatLng(-14.099582313188852, -38.76506965266699),
                // permitindo eapenas essa interações no toque, evitando girar o mapa enquanto usa o zoom
                interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                zoom: 5.5,
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
                      point: LatLng(controller.myLocation['latitude'], controller.myLocation['longitude']),
                      width: 40,
                      height: 40,
                      builder: (context) {
                        return Card(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: const Center(
                              child: Text("Eu",
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                            ));
                      },
                    ),
                    ...controller.locations.map((location) => (
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
                              (controller.locations.indexOf(location) + 1).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          ));
                      },
                    ))).toList()
                  ]
                )
              ],
            );
      }));
  }
}
