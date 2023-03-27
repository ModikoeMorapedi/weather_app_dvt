import 'package:geolocator/geolocator.dart';
import 'package:weather_app_dvt/model/location_model.dart';

class LocationService {
  Location? location;
  Future<Location?> getCurrentLocationService() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      await Geolocator.getCurrentPosition();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      location = Location(position.latitude, position.longitude);

      return location;
    } catch (e) {
      print(e);
    }
  }
}
