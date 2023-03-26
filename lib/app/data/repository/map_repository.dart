import 'package:flutter_bike_finder/app/data/providers/api.dart';
import 'package:meta/meta.dart';

class MapRepository {
  final BikeLocalizationApiClient? apiClient;

  MapRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient!.getAll();
  }

  getLocation() {
    return apiClient!.getLocation();
  }
}

