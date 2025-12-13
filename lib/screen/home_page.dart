import 'package:airhostess/screen/traning/traning_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../controller/cart_controller.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CartController());

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          InkWell(
            onTap: (){
              Get.to(() => const TrainingPage());

            },
            child: _card(
              Icons.book,
              "Training Content",
              "Text, Image, Audio, Video",
            ),
          ),
          InkWell(
            onTap: (){
              showLoyaltyDialog();
            },
            child: _card(
              Icons.star,
              "Loyalty Points",
              "Earn & Redeem",
            ),
          ),
          InkWell(
            onTap: (){
              Get.to(() => const CartPage());
            },
            child: _card(
              Icons.payment,
              "Payment",
              "Subscription & Purchase",
            ),
          ),
        ],
      ),
    );
  }
}

void showLoyaltyDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 60, color: Colors.amber),
            const SizedBox(height: 10),
            const Text(
              "Loyalty Points",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "You have earned loyalty points by completing trainings "
                  "and making purchases.\n\n"
                  "Use your points to get discounts and free courses.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            /// Points Display
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "⭐ 120 Points",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Close"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.snackbar(
                        "Redeem",
                        "Redeem feature coming soon 🎁",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text("Redeem"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _card(IconData icon, String title, String subtitle) {
  return Card(
    child: ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: Text(subtitle),
    ),
  );
}