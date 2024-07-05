import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../main.dart';
import '../../themes.dart';
import 'custombutton.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: edFirstcolor,
      actions: [
        IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'lang'.tr,
                content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          text: 'langar'.tr,
                          url: "assets/tn.png",
                          onpress: () {
                            Get.back();

                            langController.changeLang('ar');
                          }),
                      CustomButton(
                          text: 'langeng'.tr,
                          url: "assets/gb.png",
                          onpress: () {
                            Get.back();

                            langController.changeLang('en');
                          }),
                      CustomButton(
                          text: 'langfr'.tr,
                          url: "assets/fr.png",
                          onpress: () {
                            Get.back();

                            langController.changeLang('fr');
                          }),
                      const SizedBox(
                        height: 10,
                      )
                    ]),
              );
            },
            icon: const Icon(
              Icons.language,
              color: Colors.white,
              size: 40,
            ))
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
