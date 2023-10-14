import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String text;

  const InfoText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 24)));
  }
}
