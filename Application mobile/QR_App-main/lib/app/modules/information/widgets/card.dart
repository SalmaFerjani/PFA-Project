import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        width: 90,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(text.toUpperCase(),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis)),
          ),
        ),
      ),
    );
  }
}
