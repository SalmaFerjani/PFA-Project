import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../themes.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: HexColor("f0f2f4"), border: Border.all(color: Colors.black)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "months".tr,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: edFirstcolor),
        ),
        Text(
          "status".tr,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: edFirstcolor),
        ),
      ]),
    );
  }
}
