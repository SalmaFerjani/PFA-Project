import 'package:edscan/app/modules/scanner/views/qr_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/logowidget.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onLoading: const Center(child: CircularProgressIndicator()),
        (state) => ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const LogoWidget(url: 'assets/edtrust.png'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    Get.to(() => const QrView());
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "sc".tr,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
  }
}
