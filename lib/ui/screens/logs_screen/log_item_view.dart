import 'package:flutter/material.dart';
import 'package:log_viewer/data/models/log.dart';

import 'log_info_column.dart';
import 'log_side_border.dart';

class LogItemView extends StatelessWidget {
  const LogItemView({
    Key? key,
    required this.log,
  }) : super(key: key);

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 80),
            child: MainContentRow(log: log),
          ),
        ),
      ],
    );
  }
}

class MainContentRow extends StatelessWidget {
  const MainContentRow({
    Key? key,
    required this.log,
  }) : super(key: key);

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LogSideBorder(log: log),
        const SizedBox(width: 12),
        Flexible(
          child: LogInfoColumn(log: log),
        ),
      ],
    );
  }
}
