import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screen/login_page.dart';

void main() {
  runApp(const AirHostessApp());
}

/* ---------------- APP ---------------- */

class AirHostessApp extends StatelessWidget {
  const AirHostessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Air Hostess App',
      home:  LoginPage(),
    );
  }
}