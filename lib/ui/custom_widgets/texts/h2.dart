import 'package:flutter/material.dart';

const double h2Size = 24;

class H2Text extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const H2Text(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: h2Size,
      ),
    );
  }
}

class H2TextW600 extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const H2TextW600(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: h2Size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
