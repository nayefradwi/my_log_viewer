import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/texts/overhead.dart';

class SortingToggle extends StatefulWidget {
  const SortingToggle({
    super.key,
    this.onSortingSwitched,
  });
  final void Function(bool isAscending)? onSortingSwitched;
  @override
  State<SortingToggle> createState() => _SortingToggleState();
}

class _SortingToggleState extends State<SortingToggle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogsScreenBloc, LogsScreenState>(
      builder: (context, state) {
        return InkWell(
          onTap: switchSorting,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            child: OverheadTextW500Lsp1(
                context.read<LogsScreenBloc>().isAscending ? "ASC" : "DES"),
          ),
        );
      },
    );
  }

  void switchSorting() {
    if (widget.onSortingSwitched != null) {
      widget.onSortingSwitched!(!context.read<LogsScreenBloc>().isAscending);
    }
  }
}
