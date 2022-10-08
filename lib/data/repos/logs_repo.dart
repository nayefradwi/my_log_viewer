import 'package:log_viewer/data/models/log.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const String logStoreKey = "logs";

class LogsRepo {
  final String dbPath, fileName;
  final Database db;
  final StoreRef store;
  LogsRepo._({
    required this.dbPath,
    required this.db,
    required this.store,
    required this.fileName,
  });
  Future<List<AppLog>> load() async {
    final records = await store.find(db);
    return AppLog.listOfLogsFromJsonList(records);
  }

  static Future<LogsRepo> createLogsRepo(String dbPath) async {
    Database db = await databaseFactoryIo.openDatabase(
      dbPath,
      mode: DatabaseMode.existing,
    );
    StoreRef storeRef = intMapStoreFactory.store(logStoreKey);
    String fileName = basename(dbPath);
    return LogsRepo._(
      dbPath: dbPath,
      db: db,
      store: storeRef,
      fileName: fileName,
    );
  }
}
