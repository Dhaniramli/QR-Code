import 'package:get/get.dart';

import '../controllers/main_navigation_bar_controller.dart';

class MainNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationBarController>(
      () => MainNavigationBarController(),
    );
  }
}
