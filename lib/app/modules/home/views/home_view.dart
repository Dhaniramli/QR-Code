import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: [
            Container(
              child: Column(
                children: [
                  // const ImageIcon(
                  //   AssetImage(
                  //     "assets/icon/icon.png",
                  //   ),
                  //   size: 24.0,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
