import 'dart:convert';
import 'package:flutter_bike_finder/app/data/models/bike_localization_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class BikeLocalizationApiClient {
  final http.Client? httpClient;

  BikeLocalizationApiClient({@required this.httpClient});

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<List<BikeLocalizationModel>> getAll() async {
    try {
      final response = await httpClient!.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']
            .map((json) => BikeLocalizationModel.fromJson(json))
            .toList();
      } else {
        print('Error -getAll');
      }
    } catch (_) {}
    return [];
  }
}