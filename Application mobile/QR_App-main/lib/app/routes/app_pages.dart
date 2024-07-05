import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/boarding/bindings/boarding_binding.dart';
import '../modules/boarding/views/boarding_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/navlayout/bindings/navlayout_binding.dart';
import '../modules/navlayout/views/navlayout_view.dart';
import '../modules/scanner/views/scanner_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVLAYOUT;
  static const BOARDING = Routes.BOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.NAVLAYOUT,
      page: () => const NavlayoutView(),
      binding: NavlayoutBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.BOARDING,
      page: () => const BoardingView(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
  ];
}
