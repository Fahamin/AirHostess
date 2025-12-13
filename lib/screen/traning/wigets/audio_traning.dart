import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AudioTrainingPage extends StatelessWidget {
  const AudioTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Training")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.headphones),
          title: Text("Audio Lesson ${i + 1}"),
          trailing: const Icon(Icons.play_arrow),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Playing audio (Dummy)")),
            );
          },
        ),
      ),
    );
  }
}

