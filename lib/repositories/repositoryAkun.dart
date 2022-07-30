// import 'package:flutter/cupertino.dart';
import 'package:projek_akhir3/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:async/async.dart';

class RepositoryAkun {
  DatabaseConnection? _databaseConnection;
  RepositoryAkun() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get databaseAkun async {
    if (_database != null) return _database;
    _database = await _databaseConnection!.setDatabaseAkun();
    return _database;
  }

  insertAkun(table, data) async {
    var connection = await databaseAkun;
    return await connection!.insert(table, data);
  }

  readDataByID(table, password, username) async {
    var connection = await databaseAkun;
    List<Map<String, Object?>>? maps = await connection?.rawQuery(
        "Select * from $table where username=? and password=?", [username][password]);
    if (maps!.length > 0) {
      return 1;
    }
  }
}