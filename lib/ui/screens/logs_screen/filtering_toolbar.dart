import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/buttons/error_button.dart';
import 'package:log_viewer/ui/custom_widgets/buttons/primary_button.dart';
import 'package:log_viewer/ui/screens/logs_screen/filters/date_selection.dart';
import 'package:log_viewer/ui/screens/logs_screen/filters/search_text_field.dart';
import 'package:log_viewer/ui/screens/logs_screen/filters/sorting_toggle.dart';

class FilteringToolBar extends StatefulWidget {
  const FilteringToolBar({
    Key? key,
  }) : super(key: key);

  @override
  State<FilteringToolBar> createState() => _FilteringToolBarState();
}

class _FilteringToolBarState extends State<FilteringToolBar> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 300,
            child: SearchTextField(controller: controller),
          ),
          const SizedBox(width: 16),
          DateSelectionWidget(
            label: "From",
            onDateSelected: (time) {},
          ),
          const SizedBox(width: 8),
          DateSelectionWidget(
            label: "To",
            onDateSelected: (time) {},
          ),
          const SizedBox(width: 8),
          SortingToggle(
            onSortingSwitched: context.read<LogsScreenBloc>().changeSort,
          ),
          const SizedBox(width: 8),
          BlocBuilder<LogsScreenBloc, LogsScreenState>(
            builder: (context, state) {
              bool isDisabled = state is! LogsScreenFilterSelectedState;
              return PrimaryElevatedButton(
                label: "confirm",
                onPressed: isDisabled
                    ? null
                    : context.read<LogsScreenBloc>().confirmFilter,
              );
            },
          ),
          const SizedBox(width: 8),
          BlocBuilder<LogsScreenBloc, LogsScreenState>(
            builder: (context, state) {
              bool isDisabled = state is! LogsScreenFilteredState &&
                  state is! LogsScreenFilterSelectedState;
              return ErrorElevatedButton(
                label: "clear",
                onPressed:
                    isDisabled ? null : context.read<LogsScreenBloc>().clear,
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
