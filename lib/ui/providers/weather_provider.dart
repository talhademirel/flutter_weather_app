import 'package:flutter/foundation.dart';
import 'package:flutter_weather_app/data/models/current_weather.dart';
import 'package:flutter_weather_app/data/repositories/current_weather_repository.dart';
import 'package:location/location.dart';

class WeatherProvider extends ChangeNotifier {
  LocationData? _locationData;
  WeatherData? _weatherData;

  WeatherData? get getWeatherData => _weatherData;
  LocationData? get getLocationData => _locationData;

  var weatherRepo = WeatherRepository();

  Future<void> fetchWeatherData() async {
    await getCurrentLocation();
    _weatherData = await weatherRepo.fetchWeatherData(_locationData!);
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    _locationData = locationData;
    notifyListeners();
  }
}
