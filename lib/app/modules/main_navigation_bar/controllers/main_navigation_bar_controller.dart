import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_qode/app/modules/add_product/views/add_product_view.dart';
import 'package:qr_qode/app/modules/products/views/products_view.dart';

import '../../home/views/home_view.dart';

class MainNavigationBarController extends GetxController {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  int maxCount = 3;

  final List<Widget> bottomBarPages = [
    const HomeView(),
    const ProductsView(),
    const AddProductView(),
  ];

  void changePage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
