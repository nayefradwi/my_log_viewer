import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double h1Size = 28;

class H1Text extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const H1Text(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: h1Size,
      ),
    );
  }
}
