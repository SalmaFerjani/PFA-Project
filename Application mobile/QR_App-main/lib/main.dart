import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:edscan/themes.dart';

import 'app/languages/langcontroller.dart';
import 'app/languages/language.dart';
import 'app/routes/app_pages.dart';
import 'app/services/httpoverides.dart';

SharedPreferences? localstorage;
LanguageController lang = Get.put(LanguageController());
LanguageController langController = Get.find();
PackageInfo? packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  localstorage = await SharedPreferences.getInstance();
  packageInfo = await PackageInfo.fromPlatform();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: lang.initiallanguage,
      translations: Mylanguages(),
      theme: ThemesApp.light,
      title: "Qr intern",
      initialRoute: localstorage!.getBool('finish') == true
          ? AppPages.INITIAL
          : AppPages.BOARDING,
      getPages: AppPages.routes,
    ),
  );
}
