import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/data/repos/logs_repo.dart';

import 'logs_screen_states.dart';

class LogsScreenBloc extends Cubit<LogsScreenState> {
  final LogsRepo _repo;
  bool isAscending = true, _currentIsAscending = true;

  bool get _fromUnFilteredLogs {
    return _from == null || (_searchTerm != null && _searchTerm!.isNotEmpty);
  }

  DateTime? _from, _to;
  String? _searchTerm;
  List<AppLog> _unFilteredLogs = [];
  String get fileName => _repo.fileName;
  LogsScreenBloc(this._repo) : super(LogsScreenLoadingState()) {
    _loadLogs();
  }

  Future<void> _loadLogs() async {
    _unFilteredLogs = await _repo.load();
    emit(LogsScreenLoadedState(_unFilteredLogs));
  }

  void confirmFilter() {
    if (state is! LogsScreenFilterSelectedState) return;
    _filter();
  }

  void _filter() {
    List<AppLog> logs = _fromUnFilteredLogs ? [..._unFilteredLogs] : state.logs;
    logs = _sort(logs);
    logs = _filterDate(logs);
    logs = _filterBySearchTerm(logs);
    emit(LogsScreenFilteredState(logs));
  }

  List<AppLog> _sort(List<AppLog> logs) {
    if (isAscending == _currentIsAscending) return logs;
    if (isAscending) {
      logs.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
    } else {
      logs.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
    }
    _currentIsAscending = isAscending;
    return logs;
  }

  List<AppLog> _filterDate(List<AppLog> logs) {
    if (_from == null) return logs;
    if (_from != null && _to == null) return _filterByDate(logs);
    return _filterByDateRange(logs);
  }

  List<AppLog> _filterByDate(List<AppLog> logs) {
    return logs;
  }

  List<AppLog> _filterByDateRange(List<AppLog> logs) {
    return logs;
  }

  List<AppLog> _filterBySearchTerm(List<AppLog> logs) {
    return logs;
  }

  void clear() {
    _from = null;
    _to = null;
    isAscending = true;
    _searchTerm = null;
    _currentIsAscending = isAscending;
    emit(LogsScreenLoadedState(_unFilteredLogs));
    emit(LogsScreenFilterClearedState());
  }

  void changeSort(bool? isAscending) {
    if (isAscending == null) return;
    this.isAscending = isAscending;
    emit(LogsScreenFilterSelectedState());
  }

  void changeFrom(DateTime? dateTime) {
    if (dateTime == null) return;
    _from = dateTime;
    emit(LogsScreenFilterSelectedState());
  }

  void changeTo(DateTime? dateTime) {
    if (dateTime == null) return;
    _to = dateTime;
  }

  void changeSearchTerm(String? value) {
    if (value == null) return;
    _searchTerm = value.trim();
    if (state is LogsScreenFilterSelectedState) return;
    emit(LogsScreenFilterSelectedState());
  }
}
