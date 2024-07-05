import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../themes.dart';
import '../../../components/circleicon.dart';

class BoardingModel {
  String? title, img, body;
  BoardingModel(this.title, this.img, this.body);
}

List<BoardingModel> boardingData = [
  BoardingModel('overviw'.tr, 'assets/icon.png', 'boarding1'.tr),
  BoardingModel('about'.tr, 'assets/about.png', 'boarding2'.tr),
  BoardingModel('contact'.tr, 'assets/contact.png', 'boarding3'.tr)
];

List<Widget> boardingwidget = [
  const SizedBox(),
  const SizedBox(),
  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    CircleiconButton(
        ontap: () {
          // canlaunch("https://www.facebook.com/edtrusttn");
        },
        icon: FontAwesomeIcons.facebook,
        clr: Colors.blue),
    CircleiconButton(
        ontap: () {
          // canlaunch("https://www.instagram.com/ed_trust/");
        },
        icon: FontAwesomeIcons.instagram,
        clr: Colors.pinkAccent),
    CircleiconButton(
        ontap: () {
          //  canlaunch("mailto:contact@edtrust.tn");
        },
        icon: Icons.email,
        clr: edFirstcolor),
    CircleiconButton(
        ontap: () {
          // canlaunch("http://www.poste.tn/");
        },
        icon: Icons.web,
        clr: edSecondcolor),
  ]),
];
