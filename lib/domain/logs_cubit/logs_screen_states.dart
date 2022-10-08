import 'package:log_viewer/data/models/log.dart';

class LogsScreenState {
  final List<AppLog> logs;
  LogsScreenState(this.logs);
}

class LogsScreenLoadingState extends LogsScreenState {
  LogsScreenLoadingState() : super([]);
}

class LogsScreenErrorState extends LogsScreenState {
  LogsScreenErrorState() : super([]);
}

class LogsScreenLoadedState extends LogsScreenState {
  LogsScreenLoadedState(super.logs);
}

class LogsScreenFilteringState extends LogsScreenState {
  LogsScreenFilteringState() : super([]);
}

class LogsScreenFilterSelectedState extends LogsScreenFilteringState {
  LogsScreenFilterSelectedState();
}

class LogsScreenFilterClearedState extends LogsScreenFilteringState {
  LogsScreenFilterClearedState();
}

class LogsScreenFilteredState extends LogsScreenState {
  LogsScreenFilteredState(super.logs);
}
