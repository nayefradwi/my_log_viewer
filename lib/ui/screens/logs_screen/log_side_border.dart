import 'package:flutter/material.dart';
import 'package:log_viewer/data/models/log.dart';

class LogSideBorder extends StatelessWidget {
  const LogSideBorder({
    Key? key,
    required this.log,
  }) : super(key: key);

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          log.isError ? Icons.cancel_outlined : Icons.info,
          color: log.isError ? Theme.of(context).errorColor : Colors.grey,
        ),
        const SizedBox(height: 8),
        const Expanded(
          child: VerticalDivider(thickness: 2),
        ),
      ],
    );
  }
}
