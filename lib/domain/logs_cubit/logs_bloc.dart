import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/repos/logs_repo.dart';

import 'logs_screen_states.dart';

class LogsScreenBloc extends Cubit<LogsScreenState> {
  final LogsRepo _repo;
  String get fileName => _repo.fileName;
  LogsScreenBloc(this._repo) : super(LogsScreenLoadingState()) {
    _loadLogs();
  }

  Future<void> _loadLogs() async {}
}
