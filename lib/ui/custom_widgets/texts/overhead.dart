import 'package:flutter/material.dart';

const double overheadSize = 14;

class OverheadTextW500Lsp1 extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final Color? color;
  const OverheadTextW500Lsp1(this.text, {super.key, this.align, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: overheadSize,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        color: color,
      ),
    );
  }
}
