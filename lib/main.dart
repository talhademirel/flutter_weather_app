import 'package:flutter/material.dart';
import 'package:flutter_weather_app/ui/pages/splash_screen.dart';
import 'package:flutter_weather_app/ui/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
