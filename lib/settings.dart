import 'package:flutter/material.dart' show AppBar, BuildContext, Card, Color, Colors, EdgeInsets, FontWeight, Icon, IconData, Icons, ListTile, ListView, Scaffold, StatelessWidget, Switch, Text, TextStyle, Widget;
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B), // Dark Mars sky
      appBar: AppBar(
        backgroundColor: const Color(0xFFB23A2E), // Mars red
        title: Text(
          "Useless Mars Settings",
          style: GoogleFonts.orbitron(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSetting(
            icon: Icons.air,
            title: "Control Mars Atmosphere",
            subtitle: "Switch between dusty and extra dusty.",
          ),
          _buildSetting(
            icon: Icons.light_mode,
            title: "Adjust Sun Brightness",
            subtitle: "From dim to 'blinding forever'.",
          ),
          _buildSetting(
            icon: Icons.wind_power,
            title: "Enable Dust Storm Turbo Mode",
            subtitle: "Adds 200% more dust.",
          ),
          _buildSetting(
            icon: Icons.rocket_launch,
            title: "Instant Return to Earth",
            subtitle: "Feature not found.",
          ),
          _buildSetting(
            icon: Icons.water_drop,
            title: "Fill Mars with Water",
            subtitle: "Turn the red planet blue.",
          ),
          _buildSetting(
            icon: Icons.shield,
            title: "Activate Alien Firewall",
            subtitle: "Because you never know.",
          ),
        ],
      ),
    );
  }

  Widget _buildSetting({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      color: const Color(0xFF2A2A2A),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFF7043)), // Orange Mars glow
        title: Text(
          title,
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Switch(
          value: false,
          onChanged: (val) {},
          activeColor: const Color(0xFFFF7043),
        ),
      ),
    );
  }
}
