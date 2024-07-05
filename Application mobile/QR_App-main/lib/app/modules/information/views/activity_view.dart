import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:edscan/app/modules/information/widgets/header.dart';

import '../../../../themes.dart';
import '../../../components/appbar.dart';
import '../../../data/models/information.dart';
import '../controllers/information_controller.dart';

class ActivityView extends GetView {
  const ActivityView(this.informationController, {Key? key}) : super(key: key);
  final InformationController informationController;

  @override
  Widget build(BuildContext context) {
    final List<ActivityElement>? activities =
        informationController.user.value.activities;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 60), child: const MyAppbar()),
      body: activities!.isEmpty
          ? Center(
              child: Text(
                "empty".tr,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            )
          : Column(
              children: [
                const Header(),
                Expanded(
                  child: ListView.separated(
                    itemCount: activities.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              activities[i].activity!.name!.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Column(
                              children:
                                  activities[i].months!.entries.map((entry) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        entry.key.toUpperCase() != "INSCRIPTION"
                                            ? "${entry.key.split(" ")[0].tr} ${entry.key.split(" ")[1]}"
                                            : entry.key.tr,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: edFirstcolor),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: entry.value
                                                ? Colors.green.withOpacity(0.2)
                                                : Colors.red.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: entry.value
                                                    ? Colors.green
                                                    : Colors.red)),
                                        child: Center(
                                          child: Text(
                                            entry.value
                                                ? "paid".tr
                                                : "unpaid".tr,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: entry.value
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
