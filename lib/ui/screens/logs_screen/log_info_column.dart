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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OverheadTextW500Lsp1(
          log.type.name.toUpperCase(),
          color: log.isError ? Theme.of(context).errorColor : null,
        ),
        const SizedBox(height: 8),
        MediumBodyText(log.text),
        const SizedBox(height: 4),
        // Meta data widget
        // file name, method name, line
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SmallBodyText(log.fileName),
                const SizedBox(width: 15),
                SmallBodyText(log.methodName),
                const SizedBox(width: 15),
                SmallBodyText(log.line),
              ],
            ),
            // ListView.builder(
            //   itemCount: 3,
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) => const Text("ddd"),
            // )
          ],
        ),
        const SizedBox(height: 4),
        TimeStampAndStackTraceRow(log: log)
      ],
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
