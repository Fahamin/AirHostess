
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  final String name;
  final double price;
  RxInt qty = 1.obs;

  Product(this.name, this.price);
}