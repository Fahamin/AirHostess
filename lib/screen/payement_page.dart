import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'marketplace_page.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String method;

  const PaymentSuccessPage({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle,
                size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Paid via $method",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text("Thank you for your purchase"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.offAll(() => const MarketPage()),
              child: const Text("Back to Shop"),
            ),
          ],
        ),
      ),
    );
  }
}
