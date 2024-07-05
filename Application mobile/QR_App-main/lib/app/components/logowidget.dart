import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String url;
  const LogoWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(url, width: 500, height: 200);
  }
}
