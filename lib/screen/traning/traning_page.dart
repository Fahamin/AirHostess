import 'package:airhostess/screen/traning/traning_controller.dart';
import 'package:airhostess/screen/traning/wigets/audio_traning.dart';
import 'package:airhostess/screen/traning/wigets/image_traning.dart';
import 'package:airhostess/screen/traning/wigets/text_traning.dart';
import 'package:airhostess/screen/traning/wigets/video_tranig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Training Section")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            icon: Icons.article,
            title: "Text Training",
            subtitle: "Read safety & service lessons",
            onTap: () => Get.to(() => const TextTrainingPage()),
          ),
          _card(
            icon: Icons.image,
            title: "Image Training",
            subtitle: "View training images",
            onTap: () => Get.to(() => const ImageTrainingPage()),
          ),
          _card(
            icon: Icons.headphones,
            title: "Audio Training",
            subtitle: "Listen to training audio",
            onTap: () => Get.to(() => const AudioTrainingPage()),
          ),
          _card(
            icon: Icons.video_library,
            title: "Video Training",
            subtitle: "Watch training videos",
            onTap: () => Get.to(() => const VideoTrainingPage()),
          ),
        ],
      ),
    );
  }
}Widget _card({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: Icon(icon, color: Colors.blue, size: 32),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    ),
  );
}
