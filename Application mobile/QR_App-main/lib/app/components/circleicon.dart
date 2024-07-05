import 'package:flutter/material.dart';

class CircleiconButton extends StatelessWidget {
  const CircleiconButton({Key? key, this.icon, this.clr, required this.ontap})
      : super(key: key);
  final IconData? icon;
  final Color? clr;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: clr,
        child: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}