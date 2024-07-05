import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:edscan/app/data/models/information.dart';
import 'package:edscan/app/routes/app_pages.dart';
import 'package:edscan/app/services/scanservices.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerController extends GetxController with StateMixin<Information> {
  Rx<Information> user = Information().obs;
  String? baseurl;
  QRViewController? qrcontroller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void onInit() {
    change(user.value, status: RxStatus.success());
    super.onInit();
  }

  getInformation({
    required String id,
    required String db,
    required String schoolaryear,
    required String baseurl,
  }) async {
    try {
      log("test = $baseurl");
      this.baseurl = baseurl;
      change(null, status: RxStatus.loading());
      user(await ScanServices.getStudent(
          id: id, db: db, schoolaryear: schoolaryear, baseurl: baseurl));
      Get.toNamed(Routes.INFORMATION,
          arguments: {"user": user, "url": this.baseurl});
      change(user.value, status: RxStatus.success());
    } catch (e) {
      log(e.toString());
    } finally {}
  }

  void scanQr(QRViewController controller) async {
    qrcontroller = controller;
    controller.scannedDataStream.listen((scanData) {
      final result = utf8.decode(base64.decode(scanData.code!)).split('.');
      if (result.length >= 6) {
        qrcontroller!.stopCamera();
        Get.back();
        final baseurl = result.sublist(3, result.length).join('.');
        getInformation(
            id: result[0],
            db: result[1],
            schoolaryear: result[2],
            baseurl: baseurl);
      } else {}
    });
  }
}
