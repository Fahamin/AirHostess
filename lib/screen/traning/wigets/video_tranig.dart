import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VideoTrainingPage extends StatelessWidget {
  const VideoTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Training"),centerTitle: true,),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, i) => Card(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.black12,
                child: const Icon(Icons.play_circle_fill, size: 60),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text("Video Lesson ${i + 1}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

