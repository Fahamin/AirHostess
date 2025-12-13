import 'package:airhostess/screen/payement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String selectedMethod = "bKash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Payment Method")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _paymentTile(
              title: "bKash",
              subtitle: "Pay using bKash wallet",
              icon: Icons.account_balance_wallet,
              value: "bKash",
            ),
            _paymentTile(
              title: "Nagad",
              subtitle: "Pay using Nagad wallet",
              icon: Icons.account_balance_wallet,
              value: "Nagad",
            ),
            _paymentTile(
              title: "SSLCommerz",
              subtitle: "Card / Mobile Banking",
              icon: Icons.credit_card,
              value: "SSLCommerz",
            ),
            SizedBox(height: 50,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => PaymentSuccessPage(
                    method: selectedMethod,
                  ));
                },
                child: const Text("Submit Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
  }) {
    return Card(
      child: RadioListTile<String>(
        value: value,
        groupValue: selectedMethod,
        onChanged: (v) {
          setState(() => selectedMethod = v!);
        },
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        secondary: Icon(icon),
      ),
    );
  }
}
