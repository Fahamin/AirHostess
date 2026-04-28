import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../data/product_model.dart';
import 'cart_page.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final controller = Get.put(CartController());

    // Product List (Image URL যোগ করলে আরও সুন্দর লাগবে)
    final products = [
      Product("Training Course", 30),
      Product("Uniform Kit", 50),
      Product("Interview Guide", 20),
      Product("Makeup Set", 40),
      Product("Safety Manual", 15),
      Product("Flight Bag", 60),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Academy Shop",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black87),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Exclusive Gear for You",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // Card height adjustment
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (_, i) => _buildProductCard(products[i], controller),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => const CartPage()),
        backgroundColor: Colors.blueAccent,
        icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
        label: const Text("View Cart", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildProductCard(Product product, CartController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Hero(
                tag: product.name,
                child: Icon(
                  _getIconForProduct(product.name),
                  size: 50,
                  color: Colors.blueAccent.withOpacity(0.7),
                ),
              ),
            ),
          ),

          // Details Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.add(product);
                      Get.snackbar(
                        "Success",
                        "${product.name} added!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blueAccent,
                        colorText: Colors.white,
                        margin: const EdgeInsets.all(15),
                        duration: const Duration(seconds: 1),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // প্রোডাক্ট অনুযায়ী আইকন সেট করার ফাংশন
  IconData _getIconForProduct(String name) {
    if (name.contains("Course")) return Icons.school_rounded;
    if (name.contains("Uniform")) return Icons.checkroom_rounded;
    if (name.contains("Guide")) return Icons.menu_book_rounded;
    if (name.contains("Makeup")) return Icons.face_retouching_natural;
    return Icons.shopping_bag_outlined;
  }
}