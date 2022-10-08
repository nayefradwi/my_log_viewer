import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:path/path.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted, onChanged;
  const SearchTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogsScreenBloc, LogsScreenState>(
      buildWhen: (previous, current) => current is LogsScreenFilterClearedState,
      listenWhen: (previous, current) =>
          current is LogsScreenFilterClearedState,
      listener: (context, state) {
        if (current is LogsScreenFilterClearedState) controller.clear();
      },
      builder: (context, state) {
        return TextField(
          onSubmitted: onSubmitted,
          controller: controller,
          onChanged: onChanged,
          decoration: const InputDecoration(
              hintText: "Search", suffixIcon: Icon(Icons.search)),
        );
      },
    );
  }
}
