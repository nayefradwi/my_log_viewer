import 'package:flutter/material.dart';

const double borderRadius16 = 16;

class PrimaryRoundedBorderContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding, margin;
  final double? height, width;
  const PrimaryRoundedBorderContainer({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius16),
      ),
      child: child,
    );
  }
}
