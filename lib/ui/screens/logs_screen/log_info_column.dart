import 'package:flutter/material.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/ui/custom_widgets/texts/body.dart';
import 'package:log_viewer/ui/custom_widgets/texts/overhead.dart';
import 'package:log_viewer/ui/util/date_formatter.dart';

class LogInfoColumn extends StatelessWidget {
  const LogInfoColumn({
    Key? key,
    required this.log,
  }) : super(key: key);

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? metadata = log.metadata;
    return Container(
      color: Colors.green,
      constraints: BoxConstraints.tightFor(height: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OverheadTextW500Lsp1(
            log.type.name.toUpperCase(),
            color: log.isError ? Theme.of(context).errorColor : null,
          ),
          const SizedBox(height: 8),
          MediumBodyText(log.text),
          const SizedBox(height: 4),
          Row(
            children: [
              SmallBodyText(log.fileName),
              const SizedBox(width: 15),
              SmallBodyText(log.methodName),
              const SizedBox(width: 15),
              SmallBodyText(log.line),
            ],
          ),
          if (metadata != null)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: metadata.length,
              itemBuilder: (context, index) {
                MapEntry<String, dynamic> entry =
                    metadata.entries.elementAt(index);
                String key = entry.key;
                String value = entry.value.toString();
                return SmallBodyText("$key:$value");
              },
            ),
          const SizedBox(height: 4),
          TimeStampAndStackTraceRow(log: log)
        ],
      ),
    );
  }
}

class TimeStampAndStackTraceRow extends StatelessWidget {
  const TimeStampAndStackTraceRow({
    Key? key,
    required this.log,
  }) : super(key: key);

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, size: 15),
        const SizedBox(width: 4),
        OverheadTextW500Lsp1(
          formatDayMonthHourMinuteSeconds(
            log.timeStamp,
          ),
        ),
        const SizedBox(width: 4),
        if (log.isError)
          TextButton(
            onPressed: () {},
            child: const OverheadTextW500Lsp1("view stacktrace"),
          ),
      ],
    );
  }
}
