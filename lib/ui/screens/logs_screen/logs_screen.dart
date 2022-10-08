import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ID: ${context.read<LogsScreenBloc>().fileName}",
        ),
      ),
      body: Column(
        children: const [
          // search tool bar (must be horizontally scrollable)
          // logs list (must be responsive)
        ],
      ),
    );
  }
}
