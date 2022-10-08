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
  LogsScreenFilteringState(super.logs);
}

class LogsScreenFilterSelectedState extends LogsScreenFilteringState {
  LogsScreenFilterSelectedState(super.logs);
}

class LogsScreenFilterClearedState extends LogsScreenFilteringState {
  LogsScreenFilterClearedState(super.logs);
}

class LogsScreenFilteredState extends LogsScreenState {
  LogsScreenFilteredState(super.logs);
}
