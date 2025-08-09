import 'package:flutter/material.dart' show AppBar, BorderRadius, BorderSide, BuildContext, Card, Color, Colors, CrossAxisAlignment, EdgeInsets, Expanded, ExpansionTile, FontWeight, ListView, Padding, RoundedRectangleBorder, Row, Scaffold, StatelessWidget, Text, Theme, Widget;
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final marsColor = const Color(0xFFB23A27); // Mars red-orange
    final deepRed = const Color(0xFF8B0000); // Dark red for questions

    final faqs = [
      {
        "question": "Why does the weather forecast say 'Dust storm every day'?",
        "answer": "Because it’s Mars. The forecast hasn’t changed for 4 billion years."
      },
      {
        "question": "Can I breathe the air on Mars?",
        "answer": "Only once. Oxygen sold separately. Batteries not included."
      },
      {
        "question": "Why is my Mars app showing temperature in °C?",
        "answer": "We tried Fahrenheit but it froze to death at -60°C."
      },
      {
        "question": "My space suit has holes in it, is that a bug?",
        "answer": "It’s a feature. Helps you blend in with the atmosphere (and the vacuum)."
      },
      {
        "question": "How do I survive a dust storm?",
        "answer": "Step 1: Don’t. Step 2: Download our premium survival DLC for \$9999."
      },
      {
        "question": "Will this app work offline?",
        "answer": "Yes! Just as well as your Mars rover works without fuel."
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: marsColor,
        title: Text(
          "Help & FAQ",
          style: GoogleFonts.orbitron(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: marsColor, width: 1.5),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: marsColor,
                collapsedIconColor: marsColor,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q: ",
                      style: GoogleFonts.orbitron(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: deepRed, // Deep red for question
                      ),
                    ),
                    Expanded(
                      child: Text(
                        faq["question"]!,
                        style: GoogleFonts.orbitron(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: deepRed, // Deep red for question
                        ),
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "A: ",
                          style: GoogleFonts.orbitron(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: marsColor, // Mars red for answer
                          ),
                        ),
                        Expanded(
                          child: Text(
                            faq["answer"]!,
                            style: GoogleFonts.orbitron(
                              fontSize: 14,
                              color: marsColor, // Mars red for answer
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}