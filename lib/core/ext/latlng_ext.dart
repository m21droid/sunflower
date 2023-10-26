import 'package:google_maps_flutter/google_maps_flutter.dart';

extension AppLatLng on LatLng {
  String lat() => latitude.toStringAsFixed(4);

  String lng() => longitude.toStringAsFixed(4);

  String info() => 'Lat: ${lat()}   Lng: ${lng()}';
}
