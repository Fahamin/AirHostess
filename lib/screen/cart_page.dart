import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import 'package:airhostess/screen/payment_method_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(

      backgroundColor: Colors.grey[50], // হালকা ব্যাকগ্রাউন্ড
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),

        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Obx(() {
        if (controller.cart.isEmpty) {
          return _buildEmptyState();

        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(

                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

                itemCount: controller.cart.length,
                itemBuilder: (_, i) {
                  final item = controller.cart[i];
                  return _buildCartItem(item);
                },

              ),
            ),
            _buildPriceSummary(controller),
          ],
        );
      }),
    );
  }

  // কার্ট আইটেম ডিজাইন
  Widget _buildCartItem(item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // প্রডাক্ট আইকন/ইমেজ
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Colors.blueAccent),
          ),
          const SizedBox(width: 16),
          // নাম ও দাম
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${item.price}",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
          // কোয়ান্টিটি বাটন
          Row(
            children: [
              _circleIconButton(Icons.remove, () {
                if (item.qty.value > 1) item.qty.value--;
              }),
              SizedBox(
                width: 35,
                child: Center(
                  child: Obx(() => Text(
                    "${item.qty.value}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              _circleIconButton(Icons.add, () {
                item.qty.value++;
              }),
            ],
          ),
        ],
      ),
    );
  }

  // কাস্টম বাটন স্টাইল
  Widget _circleIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: Colors.black87),
      ),
    );
  }

  // পেমেন্ট সেকশন
  Widget _buildPriceSummary(CartController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, -5))
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Price", style: TextStyle(fontSize: 16, color: Colors.grey)),
                Obx(() => Text(
                  "\$${controller.total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent
                  ),
                )),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // controller.clear();
                  Get.to(() => const PaymentMethodPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // খালি কার্ট স্টেট
  Widget _buildEmptyState() {

              ),
            ),
            _buildCheckoutSection(controller),
          ],
        );
      }),
    );
  }

  // কার্ট আইটেমের ডিজাইন
  Widget _buildCartItem(item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // আইটেম ইমেজ হোল্ডার (যদি থাকে)
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.fastfood, color: Colors.blue),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${item.price}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            // কোয়ান্টিটি কন্ট্রোলার
            Row(
              children: [
                _qtyButton(Icons.remove, () {
                  if (item.qty.value > 1) item.qty.value--;
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Obx(() => Text(
                    "${item.qty.value}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ),
                _qtyButton(Icons.add, () {
                  item.qty.value++;
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ছোট বাটন ডিজাইন
  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: Colors.blueAccent),
      ),
    );
  }

  // নিচে পেমেন্ট সেকশন
  Widget _buildCheckoutSection(CartController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Obx(() => Text(
                  "\$${controller.total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                )),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // controller.clear(); // পেমেন্টের আগে ক্লিয়ার না করাই ভালো
                  Get.to(() => const PaymentMethodPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 0,
                ),
                child: const Text(
                  "Proceed to Checkout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // কার্ট খালি থাকলে যা দেখাবে
  Widget _buildEmptyCart() {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey.shade200),
          const SizedBox(height: 20),
          const Text("Your cart is empty", style: TextStyle(color: Colors.grey, fontSize: 16)),

        ],
      ),
    );
  }
}