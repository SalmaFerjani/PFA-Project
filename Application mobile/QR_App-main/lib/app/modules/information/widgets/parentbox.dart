import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/myrowtext.dart';

class ParentBox extends StatelessWidget {
  const ParentBox(
      {Key? key, required this.parent, required this.fullname, this.phone})
      : super(key: key);
  final String parent, fullname;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shadowColor: Colors.blueGrey,
        color: HexColor('F9F5EB'),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyrowText(nameOfInfo: parent, datainfo: fullname),
                SizedBox(
                  width: Get.width,
                  height: 40,
                  child: IconButton(
                      onPressed: () {
                        // ignore: deprecated_member_use
                        launch("tel://$phone");
                      },
                      icon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                          phone == null ? "":  phone.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                )
              ]),
        ),
      ),
    );
  }
}
