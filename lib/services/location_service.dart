import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<List<dynamic>> getCityName() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition();

      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          return [true, placemarks.first.locality ?? "Surat"];
        }
        return [true, "Surat"];
      } catch (e) {
        return [true, "Surat"];
      }
    } else if (permission == LocationPermission.denied) {
      return await getCityName();
    } else if (permission == LocationPermission.deniedForever) {
      return [true, "Surat"];
    } else {
      return [true, "Surat"];
    }
  }
}
