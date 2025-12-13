import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../controller/cart_controller.dart';
import '../data/product_model.dart';
import 'cart_page.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    final products = [
      Product("Training Course", 30),
      Product("Uniform Kit", 50),
      Product("Interview Guide", 20),
      Product("Makeup Set", 40),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Marketplace"),centerTitle: true,),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, i) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(14)),
                  ),
                  child: const Icon(Icons.shopping_bag, size: 50),
                ),
              ),
              const SizedBox(height: 8),
              Text(products[i].name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("\$${products[i].price}"),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {
                  controller.add(products[i]);
                  Get.snackbar("Cart", "Added to cart 🛒",
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text("Add cart"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () => Get.to(() => const CartPage()),
      ),
    );
  }
}