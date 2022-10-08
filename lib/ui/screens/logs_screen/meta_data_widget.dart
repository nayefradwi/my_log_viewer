import 'package:flutter/material.dart';

class MetadataWidget extends StatelessWidget {
  final MapEntry<String, dynamic> metadata;
  const MetadataWidget({
    super.key,
    required this.metadata,
  });

  @override
  Widget build(BuildContext context) {
    String key = metadata.key;
    String value = metadata.value.toString();
    return Row(
      children: [
        Text(
          "$key: ",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
