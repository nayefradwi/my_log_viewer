import 'package:log_viewer/data/models/log.dart';

class LogsScreenState {}

class LogsScreenLoadingState extends LogsScreenState {}

class LogsScreenErrorState extends LogsScreenState {}

class LogsScreenLoadedState extends LogsScreenState {
  final List<AppLog> logs;
  LogsScreenLoadedState(this.logs);
}
