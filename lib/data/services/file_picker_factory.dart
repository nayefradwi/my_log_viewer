import 'package:flutter/foundation.dart';
import 'package:log_viewer/data/services/android_file_picker.dart';
import 'package:log_viewer/data/services/file_picker.dart';
import 'package:log_viewer/data/services/windows_file_picker.dart';

IFilePicker generateFilePicker(TargetPlatform platform) {
  if (platform == TargetPlatform.windows) return WindowsFilePicker();
  return AndroidFilePicker();
}
