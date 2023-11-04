import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/constants/colors.dart';
import 'package:flutter_weather_app/ui/providers/weather_provider.dart';
import 'package:flutter_weather_app/ui/widgets/current_weather_widget.dart';
import 'package:provider/provider.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
      final weatherData = weatherProvider.getWeatherData;
      return Container(
        decoration: weatherData!.weather[0].icon.toString().contains(
                'n') //API can't return day and night information so I took this inform with cheaty way
            ? const BoxDecoration(gradient: nightGradient)
            : const BoxDecoration(gradient: dayGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CurrentWeatherWidget(weatherData: weatherData),
            //DailyWeatherWidget(),
            //HourlyWeatherWidget(),
          ],
        ),
      );
    });
  }
}
