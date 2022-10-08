import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_viewer/data/repos/logs_repo.dart';
import 'package:log_viewer/data/services/file_picker.dart';

import 'home_screen_states.dart';

const List<String> supportedFileExtensions = ["*"];

class HomeScreenBloc extends Cubit<HomeScreenState> {
  final IFilePicker filePicker;
  HomeScreenBloc(this.filePicker) : super(HomeScreenState());

  void pickFile({String? fileDropped}) async {
    try {
      String? filePath = fileDropped ??
          await filePicker.pickFile(
              "Select Logs File", supportedFileExtensions);
      emit(HomeScreenLoadingState());
      if (filePath == null) return _emitEmptyState();
      await _loadDatabase(filePath);
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeScreenErrorState("failed to load database"));
    }
  }

  void _emitEmptyState() {
    debugPrint("user did not select any file");
    emit(HomeScreenErrorState("please select a file"));
  }

  Future<void> _loadDatabase(String filePath) async {
    LogsRepo database = await LogsRepo.createLogsRepo(filePath);
    emit(HomeScreenFileChosenState(database));
  }

  void emitError(String error) {
    emit(HomeScreenErrorState(error));
  }
}
