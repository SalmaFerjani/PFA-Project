import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:edscan/app/core/function/splitdatetime.dart';
import 'package:edscan/app/modules/information/views/activity_view.dart';
import 'package:edscan/app/modules/information/views/history_view.dart';
import 'package:edscan/themes.dart';

import '../../../components/appbar.dart';
import '../../../components/customcard.dart';
import '../../../data/models/information.dart';
import '../controllers/information_controller.dart';
import '../widgets/parentbox.dart';

class InformationView extends GetView<InformationController> {
  const InformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Information user = controller.user.value;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 60), child: const MyAppbar()),
        body: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: Get.width,
                decoration: BoxDecoration(
                    color: edFirstcolor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user.photo != null
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  '${controller.baseurl}/${user.photo}'),
                              onBackgroundImageError: (exception, stackTrace) =>
                                  Image.asset(
                                "assets/account.png",
                                fit: BoxFit.cover,
                              ),
                              backgroundColor: edFirstcolor,
                            )
                          : CircleAvatar(
                              radius: 40,
                              backgroundImage: const AssetImage(
                                'assets/account.png',
                              ),
                              backgroundColor: edFirstcolor,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.classeRoom!.name == null
                            ? 'inscrit'.tr
                            : user.classeRoom!.name!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        splitDateTime(user.birthDate),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              )),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        ParentBox(
                            fullname:
                                '${user.parent!.father!.firstName} ${user.parent!.father!.lastName}',
                            phone: user.parent!.father!.phone.toString(),
                            parent: 'father'.tr),
                        ParentBox(
                            fullname:
                                '${user.parent!.mother!.firstName} ${user.parent!.mother!.lastName}',
                            phone: user.parent!.mother!.phone.toString(),
                            parent: 'mother'.tr),
                      ],
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Get.to(() => HistoryView(controller));
                          },
                          child: CustomCard(
                              icn: Icons.payment, text: 'pdetails'.tr),
                        )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ActivityView(controller));
                            },
                            child: CustomCard(
                                icn: Icons.local_activity, text: 'adetails'.tr),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ))
        ]));
  }
}
