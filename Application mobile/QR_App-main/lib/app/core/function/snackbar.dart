import 'package:flutter/material.dart';

import 'package:get/get.dart';

SnackbarController snackBar({
  required String title,
  required String message,
  required bool isERROR,
}) =>
    Get.snackbar(
      title,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 20,
      message,
      isDismissible: false,
      dismissDirection: DismissDirection.none,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: !isERROR ? Colors.green : Colors.redAccent,
      colorText: Colors.white,
      icon: !isERROR ? const Icon(Icons.done) : const Icon(Icons.warning),
    );
