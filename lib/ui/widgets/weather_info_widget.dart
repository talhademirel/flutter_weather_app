import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class InfoWidget extends StatelessWidget {
  IconData? icon;
  String? text;

  InfoWidget({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: titleColor,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text ?? '',
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(fontSize: 16, color: titleColor),
          ),
        )
      ],
    );
  }
}
