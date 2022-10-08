import 'package:flutter/material.dart';

const double captionSize = 12;

class CaptionText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final Color? color;
  const CaptionText(this.text, {super.key, this.align, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: captionSize,
        color: color,
      ),
    );
  }
}
