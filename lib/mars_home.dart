import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherControl extends StatefulWidget {
  const WeatherControl({super.key});

  @override
  State<WeatherControl> createState() => _WeatherControlState();
}

class _WeatherControlState extends State<WeatherControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "weather",
          style: GoogleFonts.orbitron(fontSize: 26,color: Colors.deepOrange),

        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
