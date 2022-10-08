import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/texts/h1.dart';

import 'log_item_view.dart';

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
        return ListView.separated(
          itemCount: logs.length,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            AppLog log = logs[index];
            return LogItemView(log: log);
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
