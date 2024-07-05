import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.text, required this.onpress, required this.url})
      : super(key: key);
  final String text, url;
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onpress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(url, width: 30, height: 50),
            const SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ));
  }
}
