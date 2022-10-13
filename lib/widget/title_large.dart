import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge({super.key, required this.text, required this.color, required this.fontSize});

  final String text;
  final color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: Theme.of(context).textTheme.headline5?.copyWith(
            color: color, fontWeight: FontWeight.bold,fontSize: fontSize,),
      );
  }
}