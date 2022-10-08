import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';

import 'logs_list_view.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // loading timer widget for when loading a file
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "ID: ${context.read<LogsScreenBloc>().fileName}",
        ),
      ),
      body: Column(
        children: const [
          // search tool bar (must be horizontally scrollable)
          Expanded(child: LogsListView())
        ],
      ),
    );
  }
}
