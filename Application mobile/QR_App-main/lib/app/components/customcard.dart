import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

class CustomCard extends StatelessWidget {
  final IconData icn;
  final String text;

  const CustomCard({Key? key, required this.icn, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor('F9F5EB'),
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icn,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text.toUpperCase())
        ],
      ),
    );
  }
}
