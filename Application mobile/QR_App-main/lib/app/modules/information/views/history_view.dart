import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:edscan/app/components/appbar.dart';
import 'package:edscan/app/modules/information/controllers/information_controller.dart';
import 'package:edscan/themes.dart';

import '../widgets/header.dart';

class HistoryView extends GetView {
  const HistoryView(
    this.informationController, {
    Key? key,
  }) : super(key: key);
  final InformationController informationController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 60), child: const MyAppbar()),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(),
          children: [
            const Header(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(
                  'assets/paiement.png',
                  scale: 1.5,
                ),
                title: Text('insciption'.tr),
                subtitle: informationController
                            .user.value.classeRoom!.months!['inscription'] ==
                        false || informationController
                            .user.value.classeRoom!.months!['inscription'] ==
                        null
                    ? Text('unpaid'.tr)
                    : Text('paid'.tr),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: informationController.months.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${informationController.months[index].split(" ")[0].tr} ${informationController.months[index].split(" ")[1]}",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: edFirstcolor),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 120,
                        decoration: BoxDecoration(
                            color: informationController.status[index]
                                ? Colors.green.withOpacity(0.2)
                                : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: informationController.status[index]
                                    ? Colors.green
                                    : Colors.red)),
                        child: Center(
                          child: Text(
                            informationController.status[index]
                                ? "paid".tr
                                : "unpaid".tr,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: informationController.status[index]
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
