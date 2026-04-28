import 'package:airhostess/screen/payement_page.dart';
import 'package:airhostess/screen/payment_method_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart"),centerTitle: true,),
      body: Obx(
            () => controller.cart.isEmpty
            ? const Center(child: Text("Cart is empty"))
            : Flexible(
              child: Column(
                        children: [
              Expanded(
                flex: 12,
                child: ListView.builder(
                  itemCount: controller.cart.length,
                  itemBuilder: (_, i) {
                    final item = controller.cart[i];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(item.name),
                        subtitle:
                        Text("\$${item.price} x ${item.qty.value}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                if (item.qty.value > 1) {
                                  item.qty.value--;
                                }
                              },
                            ),
                            Obx(() => Text(item.qty.value.toString())),
                            IconButton(
                              icon:  Icon(Icons.add_a_photo_sharp),
                              onPressed: () {
                                item.qty.value++;
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(

                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      Obx(() => Text(
                        "Total: \$${controller.total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      ElevatedButton(
                        onPressed: () {
                          controller.clear();
                          Get.off(() => const PaymentMethodPage());
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15)),
                        child: const Text("Pay Now"),
                      ),
                    ],
                  ),
                ),
              )
                        ],
                      ),
            ),
      ),
    );
  }
}
