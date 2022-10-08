import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/repos/logs_database.dart';
import 'package:log_viewer/data/services/file_picker.dart';
import 'package:mime/mime.dart';

import 'home_screen_states.dart';

const List<String> supportedFileExtensions = ["*"];

class HomeScreenBloc extends Cubit<HomeScreenState> {
  final IFilePicker filePicker;
  HomeScreenBloc(this.filePicker) : super(HomeScreenState());

  void pickFile() async {
    try {
      String? filePath = await filePicker.pickFile(
          "Select Logs File", supportedFileExtensions);
      if (filePath == null) return _emitEmptyState();
      await _loadDatabase(filePath);
    } catch (e) {
      emit(HomeScreenErrorState("failed to load database"));
    }
  }

  void _emitEmptyState() {
    debugPrint("user did not select any file");
    emit(HomeScreenErrorState("please select a file"));
  }

  Future<void> _loadDatabase(String filePath) async {
    LogsDatabase database = await LogsDatabase.createLogsDatabase(filePath);
    emit(HomeScreenFileChosenState(database));
  }
}
