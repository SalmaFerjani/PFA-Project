import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../main.dart';

class LanguageController {
  Locale initiallanguage = localstorage!.getString('lang') == null
      ? const Locale('fr')
      : Locale(localstorage!.getString('lang').toString());

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    localstorage!.setString('lang', codelang);

    Get.updateLocale(locale);
  }
}
