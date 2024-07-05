import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../themes.dart';
import '../class/boarding.dart';
import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  const BoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor('F9F9F9'),
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  edFirstcolor,
                  Colors.white,
                ],
              )),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (x) {
                        controller.onPagechanged(x);
                      },
                      itemCount: boardingData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  boardingData[index].img!,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(boardingData[index].body!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  boardingwidget[index],
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<BoardingController>(builder: (_) {
                          return TextButton(
                              onPressed: () {
                                controller.backSlide();
                              },
                              child: Text(
                                  controller.currentpage != 0
                                      ? 'Back'.tr
                                      : 'Skip'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: edFirstcolor,
                                      fontWeight: FontWeight.w600)));
                        }),
                        SmoothPageIndicator(
                          controller:
                              controller.pageController, // PageController
                          count: boardingData.length,
                          effect: const SwapEffect(
                              activeDotColor:
                                  Colors.indigo), // your preferred effect
                        ),
                        TextButton(
                            onPressed: () {
                              controller.nextSlide();
                            },
                            child: Text(
                              'Next'.tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: edFirstcolor,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )));
  }
}
