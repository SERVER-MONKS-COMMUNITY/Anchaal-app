import 'dart:async';

import 'package:anchaal/models/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  late UserLocation _currentLocation;
  Location location = Location();

  // continuously check for location updates
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();
  LocationService() {
    location.requestPermission().then((permission) {
      if (permission == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData newLocation) {
          _locationController.add(UserLocation(
              latitude: newLocation.latitude ?? 0.0,
              longitude: newLocation.longitude ?? 0.0,
              altitude: newLocation.altitude ?? 0.0,
              speed: newLocation.speed ?? 0.0));
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      LocationData userLocation = await location.getLocation();
      _currentLocation = UserLocation(
          latitude: userLocation.latitude ?? 0.0,
          longitude: userLocation.longitude ?? 0.0,
          altitude: userLocation.altitude ?? 0.0,
          speed: userLocation.speed ?? 0.0);
      // since parameter type was double? so we had to check for NULL values
    } catch (e) {
      print('Couldn\'t get the location: $e');
    }
    return _currentLocation;
  }
}
