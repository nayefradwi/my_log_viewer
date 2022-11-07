import 'package:flutter/foundation.dart';
import 'package:log_viewer/data/services/file_picker.dart';

import 'generic_file_picker.dart';

IFilePicker generateFilePicker(TargetPlatform platform) {
  return GenericFilePicker();
}
