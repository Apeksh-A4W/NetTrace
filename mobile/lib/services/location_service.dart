import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;

    // Check whether location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return null;
    }

    // Check current permission.
    LocationPermission permission =
    await Geolocator.checkPermission();

    // Ask the user for permission if needed.
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // User denied permission.
    if (permission == LocationPermission.denied) {
      return null;
    }

    // User permanently denied permission.
    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    // Get the current location.
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
  }
}