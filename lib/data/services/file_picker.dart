mixin IFilePicker {
  Future<String?> pickFile(String title, List<String> supportedExtensions);
}
