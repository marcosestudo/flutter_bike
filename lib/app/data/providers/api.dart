import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'http://dados.recife.pe.gov.br/api/3/action/datastore_search?resource_id=e6e4ac72-ff15-4c5a-b149-a1943386c031';

class BikeLocalizationApiClient {
  final http.Client? httpClient;

  BikeLocalizationApiClient({@required this.httpClient});

  Future<List<dynamic>> getAll() async {
    debugPrint("--- CHECKPOINT --- --- CHECKPOINT ------ CHECKPOINT ------ CHECKPOINT ------ CHECKPOINT ------ CHECKPOINT ------ CHECKPOINT ---");
    try {
      final response = await httpClient!.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        // debugPrint("RESPONSE: ${jsonResponse['result']['records']}");
        return jsonResponse['result']['records'];
      } else {
        debugPrint('Error -getAll');
      }
    } catch (_) {}
    return [];
  }
}