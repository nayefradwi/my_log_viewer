import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';

import 'filtering_toolbar.dart';
import 'logs_list_view.dart';
import 'search_terms_list_view.dart';

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          SizedBox(height: 8),
          FilteringToolBar(),
          SizedBox(height: 8),
          SearchTermsListView(),
          Expanded(child: LogsListView())
        ],
      ),
    );
  }
}
