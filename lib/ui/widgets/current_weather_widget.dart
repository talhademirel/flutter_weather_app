import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/models/current_weather.dart';
import 'package:flutter_weather_app/ui/widgets/weather_info_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/constants/colors.dart';
import '../../data/constants/api.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherData? weatherData;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final now = DateTime.now();
      final dt = DateTime.fromMillisecondsSinceEpoch(weatherData!.dt * 1000);
      final differenceMins = now.difference(dt).inMinutes;
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherData!.city,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)),
                ),
                Text(
                  "Updated $differenceMins mins ago",
                  style: GoogleFonts.openSans(
                      textStyle:
                          const TextStyle(fontSize: 12, color: titleColor)),
                ),
                const SizedBox(height: 20.0),
                Text(
                  '${weatherData!.main.temp.toStringAsFixed(0)}°C',
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontSize: 60,
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3)),
                ),
                ...weatherData!.weather
                    .map(
                      (e) => Text(
                        e.description[0].toUpperCase() +
                            e.description.substring(1),
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                color: titleColor,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1)),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: titleColor,
                    ),
                    Text(
                      "${weatherData!.main.tempMax.toStringAsFixed(0)}°C",
                      style: GoogleFonts.openSans(
                          textStyle:
                              const TextStyle(fontSize: 16, color: titleColor)),
                    ),
                    const SizedBox(width: 18.0),
                    const Icon(
                      Icons.arrow_downward,
                      color: titleColor,
                    ),
                    Text(
                      '${weatherData!.main.tempMin.toStringAsFixed(0)}°C',
                      style: GoogleFonts.openSans(
                          textStyle:
                              const TextStyle(fontSize: 16, color: titleColor)),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  ...weatherData!.weather
                      .map(
                        (e) => Image.network(
                          "$iconUrl${e.icon}@4x.png",
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      )
                      .toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoWidget(
                        icon: FontAwesomeIcons.wind,
                        text: "${weatherData!.wind.speed} km/s",
                      ),
                      InfoWidget(
                        icon: FontAwesomeIcons.cloud,
                        text: "${weatherData!.clouds.all}",
                      ),
                      /*
                      InfoWidget(
                        icon: FontAwesomeIcons.cloudRain,
                        text: "${weatherData!}",
                      ),
                      */
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
