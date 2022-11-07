import 'package:flutter/material.dart';

const double mediumBodySize = 18;
const double smallBodySize = 14;

class SelectableMediumBodyText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const SelectableMediumBodyText(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: mediumBodySize,
      ),
    );
  }
}

class MediumBodyText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const MediumBodyText(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: mediumBodySize,
      ),
    );
  }
}

class SmallBodyText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  const SmallBodyText(this.text, {super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: smallBodySize,
      ),
    );
  }
}
