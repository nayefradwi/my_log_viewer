mixin IFilePicker {
  Future<String?> pickFile(String title, List<String> supportedExtensions);
  Future<String?> pickAnyFile(String title);
}
