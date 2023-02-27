import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_bloc.dart';
import 'package:log_viewer/domain/logs_cubit/logs_screen_states.dart';
import 'package:log_viewer/ui/custom_widgets/texts/overhead.dart';
import 'package:log_viewer/ui/util/date_formatter.dart';

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({
    super.key,
    required this.label,
    this.onDateSelected,
  });
  final String label;
  final void Function(DateTime? time)? onDateSelected;
  @override
  State<DateSelectionWidget> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelectionWidget> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogsScreenBloc, LogsScreenState>(
      listenWhen: (previous, current) =>
          current is LogsScreenFilterClearedState,
      listener: (context, state) {
        if (state is LogsScreenFilterClearedState) {
          setState(() {
            selectedDate = null;
          });
        }
      },
      child: InkWell(
        onTap: _showDateTimePicker,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: selectedDate != null
                  ? Theme.of(context).colorScheme.tertiary
                  : Colors.grey,
            ),
          ),
          child: OverheadTextW500Lsp1(
            selectedDate != null
                ? formatDayMonthHourMinuteSeconds(selectedDate!)
                : widget.label,
          ),
        ),
      ),
    );
  }

  void _showDateTimePicker() async {
    DateTime initial = context.read<LogsScreenBloc>().getFromInitialDate();
    Duration oneYear = const Duration(days: 365);
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: initial.subtract(oneYear),
      lastDate: initial.add(oneYear),
    );
    if (date == null) return;
    // ignore: use_build_context_synchronously
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    setState(() {
      selectedDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
    if (widget.onDateSelected != null) widget.onDateSelected!(selectedDate);
  }
}
