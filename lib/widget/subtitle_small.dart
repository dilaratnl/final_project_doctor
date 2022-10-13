
import 'package:flutter/material.dart';

class SubtitleSmall extends StatelessWidget {
  const SubtitleSmall({super.key, required this.text, this.color, required this.fontSize});
  final String text;
  final color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
                    text,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: color, fontSize: fontSize,),
                  );
  }
}