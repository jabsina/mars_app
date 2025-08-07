import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherControl extends StatefulWidget {
  const WeatherControl({super.key});

  @override
  State<WeatherControl> createState() => _WeatherControlState();
}

class _WeatherControlState extends State<WeatherControl> {
  VideoPlayerController? _controller;
  int currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> weatherData = [
    {
      'video': 'assets/mars_weather_1.mp4',
      'temperature': '-65°C',
      'status': 'Dust Storm',
      'wind': '120 km/h',
      'dust': 'Extreme',
      'radiation': 'High',
      'quote': "Perfect weather to get blown off a cliff 💨",
    },
    {
      'video': 'assets/mars_weather_2.mp4',
      'temperature': '-78°C',
      'status': 'Solar Eclipse',
      'wind': '35 km/h',
      'dust': 'Low',
      'radiation': 'Dim',
      'quote': "Nothing like a blackout on a dead planet 🌘",
    },
    {
      'video': 'assets/mars_weather_3.mp4',
      'temperature': '-88°C',
      'status': 'Radiation Glitch Storm',
      'wind': '90 km/h',
      'dust': 'Glitched Particles',
      'radiation': 'Error 404: Too Much',
      'quote': "Reality.exe has stopped responding ⚡👁️‍🗨️",
    },
  ];

  @override
  void initState() {
    super.initState();
    _initVideo();

    _timer = Timer.periodic(
      const Duration(minutes: 1),
          (_) => _nextWeather(),
    );
  }

  void _initVideo() {
    final video = weatherData[currentIndex]['video']!;
    _controller = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        if (!mounted) return;
        _controller!
          ..setLooping(true)
          ..setVolume(0.0)
          ..play();
        setState(() {});
      });
  }

  void _nextWeather() async {
    await _controller?.pause();
    await _controller?.dispose();

    currentIndex = (currentIndex + 1) % weatherData.length;
    _initVideo();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weather = weatherData[currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: _buildDrawer(),
      body: Stack(
        children: [
          // Background Video
          _controller != null && _controller!.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller!.value.size.width,
                height: _controller!.value.size.height,
                child: VideoPlayer(_controller!),
              ),
            ),
          )
              : const Center(child: CircularProgressIndicator()),

          // Floating Tabs
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topLeft,
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ),
                ),
                Text(
                  weather['temperature']!,
                  style: GoogleFonts.orbitron(
                    fontSize: 42,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weather['status']!,
                  style: GoogleFonts.orbitron(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRow("Wind", weather['wind']!),
                      _buildRow("Dust Level", weather['dust']!),
                      _buildRow("Radiation", weather['radiation']!),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    weather['quote']!,
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: Colors.deepOrangeAccent,
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

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: GoogleFonts.orbitron(color: Colors.white),
          ),
          Text(
            value,
            style: GoogleFonts.orbitron(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepOrange),
            child: Center(
              child: Text(
                'Mars Control Center',
                style: GoogleFonts.orbitron(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDrawerItem(Icons.info_outline, "About", () {
            Navigator.pop(context);
            _showDialog("About", "This is a Mars weather simulation UI.");
          }),
          _buildDrawerItem(Icons.settings, "Settings", () {
            Navigator.pop(context);
            _showDialog("Settings", "Settings are currently unavailable.");
          }),
          _buildDrawerItem(Icons.bug_report, "Report Glitch", () {
            Navigator.pop(context);
            _showDialog("Glitch Report", "This feature is under maintenance.");
          }),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: GoogleFonts.orbitron(color: Colors.white)),
      onTap: onTap,
    );
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text(title, style: GoogleFonts.orbitron(color: Colors.deepOrange)),
        content: Text(message, style: GoogleFonts.orbitron(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("CLOSE", style: TextStyle(color: Colors.deepOrange)),
          )
        ],
      ),
    );
  }
}
