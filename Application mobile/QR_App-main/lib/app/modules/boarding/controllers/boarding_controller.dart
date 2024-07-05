import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:edscan/app/routes/app_pages.dart';

import '../../../../main.dart';

class BoardingController extends GetxController {
  int currentpage = 0;
  late PageController pageController;
  @override
  onInit() {
    pageController = PageController();
    super.onInit();
  }

  void skip() {}

  void nextSlide() {
    currentpage++;
    update();

    pageController.animateToPage(currentpage,
        duration: const Duration(milliseconds: 600), curve: Curves.decelerate);
    if (currentpage == 3) {
      Get.offAllNamed(Routes.NAVLAYOUT);
      localstorage!.setBool('finish', true);
    }
  }

  void backSlide() {
    currentpage--;
    update();

    pageController.animateToPage(currentpage,
        duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    if (currentpage == -1) {
      Get.offAllNamed(Routes.NAVLAYOUT);
      localstorage!.setBool('finish', true);
    }
  }

  void onPagechanged(int current) {
    currentpage = current;
    update();
  }
}
