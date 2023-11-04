import 'dart:convert';

import 'package:location/location.dart';

import '../constants/api.dart';
import 'package:flutter_weather_app/data/models/current_weather.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<WeatherData> fetchWeatherData(LocationData locationData) async {
    if (locationData.latitude != null || locationData.longitude != null) {
      var url = Uri.parse(
          '$apiUrl/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=$apiKey&units=metric');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherData.fromJson(data);
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } else {
      throw Exception('Null location data');
    }
  }
}
