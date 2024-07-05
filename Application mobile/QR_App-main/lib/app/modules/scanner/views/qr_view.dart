import 'package:edscan/app/modules/scanner/controllers/scanner_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrView extends GetView<ScannerController> {
  const QrView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.scanQr,
              onPermissionSet: (p0, p1) async {
                if (p1) {
                  await controller.qrcontroller!.resumeCamera();
                }
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 20,
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
