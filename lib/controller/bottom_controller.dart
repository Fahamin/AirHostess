import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../screen/community_page.dart';
import '../screen/home_page.dart';
import '../screen/marketplace_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  final pages = [
    const HomePage(),
    const CommunityPage(),
    const MarketPage(),
  ];

  void changeIndex(int i) {
    index.value = i;
  }
}