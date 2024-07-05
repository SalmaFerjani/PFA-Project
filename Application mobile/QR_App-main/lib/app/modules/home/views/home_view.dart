import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/logowidget.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const LogoWidget(url: 'assets/edtrust.png'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "homeString1".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const LogoWidget(url: 'assets/qrpic.png'),
      ],
    );
  }
}
