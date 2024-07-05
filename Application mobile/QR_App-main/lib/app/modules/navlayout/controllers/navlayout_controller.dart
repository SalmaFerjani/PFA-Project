import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:edscan/app/core/function/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:edscan/app/modules/about/views/about_view.dart';
import 'package:edscan/app/modules/home/views/home_view.dart';
import 'package:edscan/app/modules/scanner/views/scanner_view.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NavlayoutController extends GetxController {
  int selectedpage = 0;

  final pages = [const HomeView(), const ScannerView(), const AboutView()];

  StreamSubscription? streamSubscription;
  bool? isDeviceConnected;
  bool isalert = false;
  @override
  onInit() async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (isDeviceConnected == false) {
      dialogg();
    }
    connectivity();
    super.onInit();
  }

  connectivity() =>
      streamSubscription = Connectivity().onConnectivityChanged.listen(
        (event) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;

          if (!isDeviceConnected! && isalert == false) {
            await dialogg();
            isalert = true;
            update();
          }

          if (isalert && isDeviceConnected! ||
              isalert == false && isDeviceConnected == true) {
            log("message");
            Get.back();

            isalert = false;
            update();
            snackBar(title: 'done'.tr, message: "internet".tr, isERROR: false);
          }
        },
      );

  dialogg() async {
    Get.defaultDialog(
        barrierDismissible: false,
        content: Column(
          children: [
            Image.asset(
              'assets/nowifi.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('nointernet'.tr),
          ],
        ),
        title: '',
        cancel: TextButton.icon(
            onPressed: () async {
              Get.back();
              isalert = false;
              update();
              isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected!) {
                dialogg();
                isalert = true;
                update();
              }
            },
            icon: const Icon(Icons.refresh),
            label: Text('check'.tr)));
  }

  navigateTo(int newindex) {
    selectedpage = newindex;
    update();
  }
}
