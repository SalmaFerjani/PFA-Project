import 'package:get/get.dart';

import '../../scanner/controllers/scanner_controller.dart';
import '../controllers/navlayout_controller.dart';

class NavlayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(
      () => ScannerController(),
    );

    Get.lazyPut<NavlayoutController>(
      () => NavlayoutController(),
    );
  }
}
