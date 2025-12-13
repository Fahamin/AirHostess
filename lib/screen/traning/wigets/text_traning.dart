import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTrainingPage extends StatelessWidget {
  const TextTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Training")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: const Text(
          "Cabin Crew Safety Training\n\n"
              "• Emergency procedures\n"
              "• Passenger handling\n"
              "• Safety equipment usage\n\n"
              "Always stay calm and professional.\n\n"
              "Long text...\n\n"
              "Long text...\n\n"
              "Long text...\n\n",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
