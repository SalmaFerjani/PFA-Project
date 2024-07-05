import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../main.dart';
import '../../../components/custombutton.dart';
import '../controllers/navlayout_controller.dart';

class NavlayoutView extends GetView<NavlayoutController> {
  const NavlayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor('F9F9F9'),
              elevation: 0,
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
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              elevation: 10,
              height: 60,
              items: [
                TabItem(icon: Icons.home, title: 'menuitem1'.tr),
                TabItem(icon: Icons.qr_code, title: 'menuitem2'.tr),
                TabItem(icon: Icons.info, title: 'menuitem3'.tr),
              ],
              initialActiveIndex: controller.selectedpage,
              onTap: (int index) {
                controller.navigateTo(index);
              },
            ),
            body: GetBuilder<NavlayoutController>(builder: (_) {
              return controller.pages[controller.selectedpage];
            })));
  }
}
