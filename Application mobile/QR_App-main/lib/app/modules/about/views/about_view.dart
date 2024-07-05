import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../main.dart';
import '../../../components/logowidget.dart';
import '../../../components/socialbutton.dart';
import '../controllers/about_controller.dart';

// ignore_for_file: deprecated_member_use

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      //  print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const LogoWidget(url: 'assets/edtrust.png'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Qr intern'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    socialButton(
                      text: "Qr intern",
                      onpress: () async {
                        // String fbProtocolUrl;
                        // fbProtocolUrl = 'fb://profile/100004608431412';
                        String fallbackUrl =
                            'https://www.facebook.com/edtrusttn';
                        await launch(fallbackUrl);
                        /*   try {
                          bool launched = await launch(fbProtocolUrl);

                          if (!launched) {
                            await launch(fallbackUrl);
                          }
                        } catch (e) {
                          await launch(fallbackUrl);
                        }
                       */
                      },
                      icon: Icons.facebook,
                    ),
                    socialButton(
                      text: "contact@edtrust.tn",
                      onpress: () {
                        customLaunch('mailto:contact@edtrust.tn');
                      },
                      icon: Icons.email,
                      color: GFColors.DANGER,
                    ),
                    socialButton(
                      text: "+216 52.588.822",
                      onpress: () {
                        customLaunch('tel://52588822');
                      },
                      icon: Icons.phone,
                      color: GFColors.INFO,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text("${packageInfo!.appName}: ${packageInfo!.version}"),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
