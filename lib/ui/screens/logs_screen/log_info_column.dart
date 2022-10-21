import 'package:flutter/material.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/ui/custom_widgets/texts/body.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h2.dart';
import 'package:log_viewer/ui/custom_widgets/texts/overhead.dart';
import 'package:log_viewer/ui/screens/logs_screen/meta_data_widget.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OverheadTextW500Lsp1(
          log.type.name.toUpperCase(),
          color: log.isError ? Theme.of(context).errorColor : null,
        ),
        const SizedBox(height: 8),
        MediumBodyText(log.text),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0x1fffffff),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallBodyText("file: ${log.fileName}"),
              const SizedBox(height: 2),
              SmallBodyText("method: ${log.methodName}"),
              const SizedBox(height: 2),
              SmallBodyText("line: ${log.line}"),
              const SizedBox(height: 2),
              if (metadata != null)
                for (MapEntry<String, dynamic> entry in metadata.entries)
                  MetadataWidget(metadata: entry)
            ],
          ),
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
        SelectableOverheadTextW500Lsp1(
          formatDayMonthHourMinuteSeconds(
            log.timeStamp,
          ),
        ),
        const SizedBox(width: 4),
        if (log.isError)
          TextButton(
            onPressed: () => showStackTrace(context),
            child: const OverheadTextW500Lsp1("view stacktrace"),
          ),
      ],
    );
  }

  void showStackTrace(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  const H2Text("StackTrace"),
                  const SizedBox(height: 16),
                  MediumBodyText(log.trace ?? "no trace"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
