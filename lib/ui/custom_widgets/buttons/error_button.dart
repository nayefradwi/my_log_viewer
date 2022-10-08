import 'package:flutter/material.dart';

import 'primary_button.dart';

class ErrorElevatedButton extends StatelessWidget {
  const ErrorElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String label;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
      child: !isLoading
          ? Text(
              label.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          : const ButtonLoadingIndicator(),
    );
  }
}
