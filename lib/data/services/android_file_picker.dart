import 'package:log_viewer/data/services/file_picker.dart';

class AndroidFilePicker implements IFilePicker {
  @override
  Future<String?> pickFile(String title, List<String> supportedExtensions) {
    throw UnimplementedError();
  }
}
