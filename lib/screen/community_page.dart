import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Community"),centerTitle: true,),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (_, i) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text("Crew Post ${i + 1}"),
          subtitle: const Text("This is a dummy community post"),
        ),
      ),
    );
  }
}
