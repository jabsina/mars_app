import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Mars-dark theme
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          'About Us',
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "🌪 About Us – Because You Deserve to Know Who's Behind This Madness\n",
                style: GoogleFonts.orbitron(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome to TotallyAccuWeather™ – the most unreliable weather forecasting app in this galaxy (and possibly others). If you're here looking for accurate predictions, turn around. Now. Seriously, go outside and look up. That’s more accurate.\n",
                style: _textStyle(),
              ),
              Text(
                "Our Story\n",
                style: _sectionTitle(),
              ),
              Text(
                "It started one stormy evening when we all forgot our umbrellas and thought:\n"
                    "\"What if we made an app that tells people it's sunny while they’re getting hit by a Martian dust devil?\"\n"
                    "And thus, TotallyAccuWeather™ was born.\n",
                style: _textStyle(),
              ),
              Text(
                "What We Offer:\n",
                style: _sectionTitle(),
              ),
              _bullet("☀ Sunshine even during meteor showers"),
              _bullet("🌧 100% chance of rainbows in underground lava tubes"),
              _bullet("🪐 Mars dust storms delivered to your home screen"),
              _bullet("🧊 Temperatures so cold your sarcasm might freeze"),
              _bullet("🔥 Heat warnings for your cryo-chambers"),
              const SizedBox(height: 16),
              Text(
                "Our Values\n",
                style: _sectionTitle(),
              ),
              _bullet("Accuracy? Never heard of it."),
              _bullet("Responsibility? Meh."),
              _bullet("Entertainment? Absolutely."),
              _bullet("Sarcasm? Required."),
              const SizedBox(height: 16),
              Text(
                "Meet the Team\n",
                style: _sectionTitle(),
              ),
              _bullet("👨‍🚀 Chief Meteorologist – Can’t read a weather map but loves Martian clouds"),
              _bullet("🎨 UI/UX Designer – Makes sure the app crashes in style"),
              _bullet("👨‍💻 Backend Dev – Still trying to figure out which end is the back"),
              _bullet("🤖 Support Bot – Replies “Have you tried going outside?” to every complaint"),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "Still here? Wow, you're persistent. You’ll fit right in.\n"
                      "Now go ahead, check the weather—we dare you.",
                  style: _textStyle().copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return GoogleFonts.orbitron(
      color: Colors.white,
      fontSize: 14,
    );
  }

  TextStyle _sectionTitle() {
    return GoogleFonts.orbitron(
      fontSize: 18,
      color: Colors.orangeAccent,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.redAccent)),
          Expanded(
            child: Text(
              text,
              style: _textStyle(),
            ),
          ),
        ],
      ),
    );
  }
}