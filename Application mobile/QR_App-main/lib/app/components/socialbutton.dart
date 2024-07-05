import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

GFButton socialButton({
  IconData? icon,
  required String text,
  required Function() onpress,
  Color color = GFColors.PRIMARY,
}) =>
    GFButton(
        onPressed: onpress,
        size: GFSize.MEDIUM,
        focusColor: Colors.white,
        splashColor: Colors.white,
        text: text,
        fullWidthButton: true,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        shape: GFButtonShape.pills,
        color: color);
