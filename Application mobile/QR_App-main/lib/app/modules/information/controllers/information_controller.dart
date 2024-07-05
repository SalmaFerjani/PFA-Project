import 'package:get/get.dart';

import 'package:edscan/app/data/models/information.dart';

class InformationController extends GetxController {
  final Rx<Information> user = Get.arguments["user"];
  final String baseurl = Get.arguments["url"];

  String? inscription;
  bool? inscriptionStatus;

  final List<String> months = [];
  final List<bool> status = [];

  @override
  void onInit() {
    monthsHistory();

    super.onInit();
  }

  void monthsHistory() {
    Map<String, bool>? months = user.value.classeRoom!.months;
    months!.forEach((key, value) {
      if (key.toLowerCase() != "inscription") {
        this.months.add(key);
        status.add(value);
      } else {
        inscription = key;
        inscriptionStatus = value;
      }
    });
  }
}

