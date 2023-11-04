import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/data/constants/colors.dart';
import 'package:flutter_weather_app/ui/pages/home_page/home_page.dart';
import 'package:flutter_weather_app/ui/providers/weather_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => Provider.of<WeatherProvider>(context, listen: false)
            .fetchWeatherData()).then((_) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: nightGradient),
      child: const Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
