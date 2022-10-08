import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

enum AppLogType {
  debug,
  error,
  info,
}

class AppLog {
  static String methodNameKey = "methodName";
  static String fileNameKey = "fileName";
  static String lineKey = "line";
  static String metadataKey = "metadata";
  static String textKey = "text";
  static String deviceTimeKey = "deviceTime";
  static String traceKey = "trace";
  static String exceptionKey = "exception";
  static String typeKey = "type";
  static String timestampKey = "timestamp";

  late String methodName, fileName, line;
  Map<String, dynamic>? metadata;
  late String text;
  late DateTime deviceTime;
  String? trace;
  Object? errorObject;
  late Timestamp _timestamp;
  late AppLogType type;

  AppLog._({
    required this.methodName,
    required this.text,
  });

  AppLog.info({
    required this.text,
    String? file,
    String? method,
    String? line,
    this.metadata,
    StackTrace? stack,
  }) {
    StackTrace currentStack = stack ?? StackTrace.current;
    ClassifiedTrace trace = ClassifiedTrace.fromCurrent(currentStack);
    fileName = file ?? trace.file;
    methodName = method ?? trace.function;
    this.line = line ?? trace.line;
    deviceTime = DateTime.now();
    _timestamp = Timestamp.fromDateTime(deviceTime);
    type = AppLogType.info;
  }

  AppLog.error({
    String? text,
    String? file,
    String? method,
    String? line,
    required this.errorObject,
    this.metadata,
    StackTrace? stack,
  }) {
    StackTrace currentStack = stack ?? StackTrace.current;
    ClassifiedTrace trace = ClassifiedTrace.fromCurrent(currentStack);
    fileName = file ?? trace.file;
    methodName = method ?? trace.function;
    this.line = line ?? trace.line;
    deviceTime = DateTime.now();
    _timestamp = Timestamp.fromDateTime(deviceTime);
    type = AppLogType.error;
    if (text == null) {
      this.text = errorObject.toString();
    } else {
      this.text = "$text: ${errorObject.toString()}";
    }
    this.trace = currentStack.toString();
  }

  AppLog.debug({
    String? file,
    String? method,
    String? line,
    required this.text,
    this.metadata,
    this.errorObject,
    bool shouldLogTrace = false,
    StackTrace? stack,
  }) {
    StackTrace currentStack = stack ?? StackTrace.current;
    ClassifiedTrace trace = ClassifiedTrace.fromCurrent(currentStack);
    fileName = file ?? trace.file;
    methodName = method ?? trace.function;
    this.line = line ?? trace.line;
    deviceTime = DateTime.now();
    _timestamp = Timestamp.fromDateTime(deviceTime);
    type = AppLogType.debug;
    if (shouldLogTrace) this.trace = StackTrace.current.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      methodNameKey: methodName,
      fileNameKey: fileName,
      lineKey: line,
      timestampKey: _timestamp,
      metadataKey: metadata,
      exceptionKey: errorObject.toString(),
      traceKey: trace,
      deviceTimeKey: deviceTime.toIso8601String(),
      typeKey: type.name,
      textKey: text,
    };
  }

  factory AppLog.fromJson(Map<String, dynamic> json) {
    AppLog log = AppLog._(
      methodName: json[methodNameKey] ?? "unknown method",
      text: json[textKey] as String,
    );
    log.metadata = json[metadataKey] as Map<String, dynamic>?;
    String? exception = json[exceptionKey] as String?;
    log.errorObject = exception != null ? Exception(exception) : null;
    log.trace = json[traceKey] as String?;
    log.deviceTime = DateTime.parse(json[deviceTimeKey] as String);
    log.type = _getType(json[typeKey] as String);
    log._timestamp = Timestamp.fromDateTime(log.deviceTime);
    log.fileName = json[fileNameKey] ?? "unknown file";
    log.line = json[lineKey] ?? "0";
    return log;
  }

  static List<AppLog> listOfLogsFromJsonList(List<RecordSnapshot> jsonList) {
    List<AppLog> logs = [];
    for (RecordSnapshot record in jsonList) {
      try {
        AppLog log = AppLog.fromJson(record.value);
        logs.add(log);
      } catch (e) {
        logs.add(AppLog.info(text: "failed to cast"));
      }
    }
    return logs;
  }

  static AppLogType _getType(String type) {
    if (type == AppLogType.info.name) return AppLogType.info;
    if (type == AppLogType.error.name) return AppLogType.error;
    return AppLogType.debug;
  }

  @override
  String toString() {
    return "$deviceTime - [ ${type.name}; $line ]: $fileName, $methodName, $text\nMetadata: ${metadata.toString()}\nTrace: $trace\nException: ${errorObject.toString()}";
  }
}

class ClassifiedTrace {
  late final String function, file, line;
  ClassifiedTrace._({
    required this.function,
    required this.file,
    required this.line,
  });

  ClassifiedTrace._empty() {
    file = "empty";
    function = "empty";
    line = "empty";
  }

  factory ClassifiedTrace.fromCurrent(StackTrace trace) {
    try {
      final frames = trace.toString().split('\n');
      final callerFunctionName = _getFunctionNameFromFrame(frames[1]);
      final fileInfo = _getFileInfoFromFrame(frames[0]);
      return ClassifiedTrace._(
        function: callerFunctionName,
        file: fileInfo[0],
        line: fileInfo[1],
      );
    } catch (e) {
      return ClassifiedTrace._empty();
    }
  }

  static List<String> _getFileInfoFromFrame(String trace) {
    final indexOfFileName = trace.indexOf(RegExp('[A-Za-z]+.dart'));
    final fileInfo = trace.substring(indexOfFileName);
    return fileInfo.split(':');
  }

  static String _getFunctionNameFromFrame(String trace) {
    final indexOfWhiteSpace = trace.indexOf(' ');
    final subStr = trace.substring(indexOfWhiteSpace);
    final indexOfFunction = subStr.indexOf(RegExp('[A-Za-z0-9]'));
    return subStr
        .substring(indexOfFunction)
        .substring(0, subStr.substring(indexOfFunction).indexOf(' '));
  }
}
