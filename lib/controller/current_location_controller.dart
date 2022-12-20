import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationController extends ChangeNotifier {
  String? latitude;
  String? longitude;
  bool isPermissionGiven = false;
  getCurrentoLocation() async {
    LocationPermission permission;

    permission = await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true,
    );
    if (location != null) {
      latitude = location.latitude.toString();
      longitude = location.longitude.toString();
      isPermissionGiven = true;

      notifyListeners();
    } else {
      isPermissionGiven = false;
      notifyListeners();
      throw Exception('Failed to get Current Location');
    }
  }
}
