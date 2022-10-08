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
