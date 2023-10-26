import 'package:flutter/material.dart';

class AppInfoText extends StatelessWidget {
  final String text;

  const AppInfoText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
