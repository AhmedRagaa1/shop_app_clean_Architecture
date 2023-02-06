import 'package:geolocator/geolocator.dart';

class LocationHelper
{
  static Future<Position> determineCurrentLocation()async
  {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!isServiceEnabled)
    {
      await Geolocator.requestPermission();
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}