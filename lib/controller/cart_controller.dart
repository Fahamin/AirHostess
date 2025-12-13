import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/product_model.dart';

class CartController extends GetxController {
  RxList<Product> cart = <Product>[].obs;

  double get total =>
      cart.fold(0, (sum, item) => sum + item.price * item.qty.value);

  void add(Product p) {
    cart.add(p);
  }

  void clear() {
    cart.clear();
  }
}