import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_navigation_bar_controller.dart';

class MainNavigationBarView extends StatelessWidget {
  const MainNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainNavigationBarController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          (controller.bottomBarPages.length <= controller.maxCount)
              ? AnimatedNotchBottomBar(
                  pageController: controller.pageController,
                  color: Colors.orange,
                  showLabel: false,
                  notchColor: Colors.black87,
                  bottomBarItems: const [
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      activeItem: Icon(
                        Icons.home,
                        color: Colors.orange,
                      ),
                      itemLabel: 'Page 1',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.list_alt_outlined,
                        color: Colors.black,
                      ),
                      activeItem: Icon(
                        Icons.list_alt_outlined,
                        color: Colors.orange,
                      ),
                      itemLabel: 'Page 2',
                    ),
                    BottomBarItem(
                      inActiveItem: Icon(
                        Icons.post_add_rounded,
                        color: Colors.black,
                      ),
                      activeItem: Icon(
                        Icons.post_add_rounded,
                        color: Colors.orange,
                      ),
                      itemLabel: 'Page 3',
                    ),
                    
                  ],
                  onTap: (index) {
                    /// control your animation using page controller
                    controller.pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                )
              : null,
      body: PageView(
        controller: controller.pageController,
        children: controller.bottomBarPages,
        onPageChanged: (index) {
          controller.currentIndex = index;
        },
      ),
    );
  }
}