import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
