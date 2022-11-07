import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/models/log.dart';
import 'package:log_viewer/data/repos/logs_repo.dart';

import 'logs_screen_states.dart';

class LogsScreenBloc extends Cubit<LogsScreenState> {
  final LogsRepo _repo;
  bool isAscending = true, _currentIsAscending = true;
  final List<String> _searchTerms = [];
  List<String> get searchTerms => _searchTerms;
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
    List<AppLog> logs = [..._unFilteredLogs];
    _sort(logs);
    logs = _filterDate(logs);
    logs = _filterBySearchTerm(logs);
    emit(LogsScreenFilteredState(logs));
  }

  void _sort(List<AppLog> logs) {
    if (isAscending == _currentIsAscending) return;
    if (isAscending) {
      logs.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
    } else {
      logs.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
    }
    _currentIsAscending = isAscending;
  }

  List<AppLog> _filterDate(List<AppLog> logs) {
    if (_from != null && _to != null) return _filterByDateRange(logs);
    if (_from == null && _to == null) return logs;
    return _filterByDate(logs);
  }

  List<AppLog> _filterByDate(List<AppLog> logs) {
    List<AppLog> logsThatAreSameMoment = [];
    DateTime dateFilter = _from ?? _to!;
    for (AppLog log in logs) {
      if (_isSameMoment(log.timeStamp, dateFilter)) {
        logsThatAreSameMoment.add(log);
      }
    }
    return logsThatAreSameMoment;
  }

  bool _isSameMoment(DateTime d1, DateTime d2) {
    return d1.year == d2.year &&
        d1.month == d2.month &&
        d1.day == d2.day &&
        d1.hour == d2.hour &&
        d1.minute == d2.minute;
  }

  List<AppLog> _filterByDateRange(List<AppLog> logs) {
    List<AppLog> logsThatAreSameMoment = [];
    for (AppLog log in logs) {
      if (log.timeStamp.isBefore(_to!) && log.timeStamp.isAfter(_from!)) {
        logsThatAreSameMoment.add(log);
      }
    }
    return logsThatAreSameMoment;
  }

  List<AppLog> _filterBySearchTerm(List<AppLog> logs) {
    if (_searchTerm == null) return logs;
    _searchTerms.add(_searchTerm!);
    for (String term in searchTerms) {
      List<AppLog> logsThatHaveSearchTerm = [];
      for (AppLog log in logs) {
        if (log.text.contains(term)) {
          logsThatHaveSearchTerm.add(log);
          continue;
        }
        if (log.hasMetadata(term)) {
          logsThatHaveSearchTerm.add(log);
        }
      }
      logs = logsThatHaveSearchTerm;
    }
    _searchTerm = null;
    return logs;
  }

  void clear() {
    _from = null;
    _to = null;
    isAscending = true;
    _searchTerm = null;
    _currentIsAscending = isAscending;
    _searchTerms.clear();
    emit(LogsScreenFilterClearedState(_unFilteredLogs));
    emit(LogsScreenLoadedState(_unFilteredLogs));
  }

  void changeSort(bool? isAscending) {
    if (isAscending == null) return;
    this.isAscending = isAscending;
    emit(LogsScreenFilterSelectedState(state.logs));
  }

  void changeFrom(DateTime? dateTime) {
    if (dateTime == null) return;
    _from = dateTime;
    emit(LogsScreenFilterSelectedState(state.logs));
  }

  void changeTo(DateTime? dateTime) {
    if (dateTime == null) return;
    _to = dateTime;
    emit(LogsScreenFilterSelectedState(state.logs));
  }

  void changeSearchTerm(String? value) {
    if (value == null) return;
    _searchTerm = value.trim();
    if (state is LogsScreenFilterSelectedState) return;
    emit(LogsScreenFilterSelectedState(state.logs));
  }

  DateTime getFromInitialDate() {
    if (_unFilteredLogs.isEmpty) return DateTime.now();
    AppLog firstLog = _unFilteredLogs.first;
    return DateTime(firstLog.timeStamp.year, firstLog.timeStamp.month,
        firstLog.timeStamp.day);
  }
}
