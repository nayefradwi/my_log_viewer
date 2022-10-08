import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

class LogsListView extends StatelessWidget {
  const LogsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogsScreenBloc, LogsScreenState>(
      buildWhen: (previous, current) => current is LogsScreenLoadedState,
      builder: (context, state) {
        List<AppLog> logs = state.logs;
        if (logs.isEmpty) return const EmptyLogsListWidget();
        return ListView.builder(
          itemCount: logs.length,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          // log item widget
          itemBuilder: (context, index) {
            AppLog log = logs[index];
            return Text(log.text);
          },
        );
      },
    );
  }
}

class EmptyLogsListWidget extends StatelessWidget {
  const EmptyLogsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: H1Text("Nothing to see here"));
  }
}
