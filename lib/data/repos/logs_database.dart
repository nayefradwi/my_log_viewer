import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

const String logStoreKey = "logs";

class LogsDatabase {
  final String dbPath;
  final Database _db;
  final StoreRef _store;
  LogsDatabase._(
    this.dbPath,
    this._db,
    this._store,
  );

  static Future<LogsDatabase> createLogsDatabase(String dbPath) async {
    Database db = await databaseFactoryIo.openDatabase(
      dbPath,
      mode: DatabaseMode.existing,
    );
    StoreRef storeRef = intMapStoreFactory.store(logStoreKey);
    return LogsDatabase._(dbPath, db, storeRef);
  }
}
