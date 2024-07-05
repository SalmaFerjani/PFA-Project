import 'package:flutter/material.dart';

class MyrowText extends StatelessWidget {
  const MyrowText(
      {Key? key, required this.nameOfInfo, required this.datainfo, this.clr})
      : super(key: key);
  final String? nameOfInfo, datainfo;
  final Color? clr;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$nameOfInfo : ',
        style: const TextStyle(color: Colors.black, fontSize: 20),
        children: [
          TextSpan(
              text: datainfo ?? "",
              style: TextStyle(color: clr ?? Colors.blueGrey, fontSize: 18)),
        ],
      ),
    );
  }
}
