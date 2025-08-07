import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class WeatherControl extends StatefulWidget {
  const WeatherControl({super.key});

  @override
  State<WeatherControl> createState() => _WeatherControlState();
}

class _WeatherControlState extends State<WeatherControl> {
  late VideoPlayerController _controller;
  final List<String> _videoPaths = [
    'assets/mars_weather_1.mp4',
    'assets/mars_weather_2.mp4',
  ];
  int _currentVideoIndex = 0;
  Timer? _videoSwitchTimer;

  @override
  void initState() {
    super.initState();
    _initializeVideo(_videoPaths[_currentVideoIndex]);
    _startVideoSwitchTimer();
  }

  void _initializeVideo(String path) {
    _controller = VideoPlayerController.asset(path)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.setVolume(0.0); // Mute
        _controller.play();
      });
  }

  void _startVideoSwitchTimer() {
    _videoSwitchTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _currentVideoIndex = (_currentVideoIndex + 1) % _videoPaths.length;
      _controller.pause();
      _controller.dispose();
      _initializeVideo(_videoPaths[_currentVideoIndex]);
    });
  }

  @override
  void dispose() {
    _videoSwitchTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background video
          _controller.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : const Center(child: CircularProgressIndicator()),

          // Foreground content
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    "Weather",
                    style: GoogleFonts.orbitron(
                      fontSize: 26,
                      color: Colors.deepOrange,
                    ),
                  ),
                  centerTitle: true,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Mars Weather Simulation 🌌",
                    style: GoogleFonts.orbitron(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
