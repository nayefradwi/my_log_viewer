import 'package:file_picker/file_picker.dart';

import 'file_picker.dart';

class GenericFilePicker implements IFilePicker {
  @override
  Future<String?> pickFile(
    String title,
    List<String> supportedExtensions,
  ) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: title,
      type: FileType.custom,
      allowedExtensions: supportedExtensions,
      lockParentWindow: true,
    );
    return result?.files.single.path;
  }

  @override
  Future<String?> pickAnyFile(String title) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: title,
      type: FileType.any,
      lockParentWindow: true,
    );
    return result?.files.single.path;
  }
}
