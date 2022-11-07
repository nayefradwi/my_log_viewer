import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/texts/body.dart';

import 'filtering_toolbar.dart';
import 'logs_list_view.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // loading timer widget for when loading a file
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

class SearchTermsListView extends StatelessWidget {
  const SearchTermsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogsScreenBloc, LogsScreenState>(
      builder: (context, state) {
        int searchTermsLength =
            context.read<LogsScreenBloc>().searchTerms.length;
        if (searchTermsLength == 0) return Container();
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: searchTermsLength,
            itemBuilder: (context, index) {
              String searchTerm =
                  context.read<LogsScreenBloc>().searchTerms[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(label: MediumBodyText(searchTerm)),
              );
            },
          ),
        );
      },
    );
  }
}
