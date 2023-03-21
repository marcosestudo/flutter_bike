import 'package:flutter_bike_finder/app/data/providers/api.dart';
import 'package:meta/meta.dart';

class MyRepository {
  final BikeLocalizationApiClient? apiClient;

  MyRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient!.getAll();
  }
}

