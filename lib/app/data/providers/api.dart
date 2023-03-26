import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:meta/meta.dart';

const baseUrl = 'http://dados.recife.pe.gov.br/api/3/action/datastore_search?resource_id=e6e4ac72-ff15-4c5a-b149-a1943386c031';

class BikeLocalizationApiClient {
  final http.Client? httpClient;

  BikeLocalizationApiClient({@required this.httpClient});

  Future<List<dynamic>> getAll() async {
    try {
      final response = await httpClient!.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse['result']['records'];
      } else {
        debugPrint('Error -getAll');
      }
    } catch (_) {}
    return [];
  }

  Future<dynamic> getLocation() async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    return {'latitude': _locationData.latitude, 'longitude': _locationData.longitude};
  }
}
