import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:async/async.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_inventoriBarang');
    var database =
        await openDatabase(path, version: 1, onCreate: _oncreatingDatabase);
    return database;
  }

  _oncreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE tableBarang(idBarang INTEGER PRIMARY KEY AUTO_INCREMENT, namaBarang TEXT, jumlahBarang INTEGER, hargaBarang , tanggalMasuk TEXT, keterangan TEXT)");
  }

// DATABASE AKUN
  setDatabaseAkun() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_akun');
    var databaseAkun =
        await openDatabase(path, version: 1, onCreate: _oncreatingDatabaseAkun);
    return databaseAkun;
  }

  _oncreatingDatabaseAkun(Database databaseAkun, int version) async {
    await databaseAkun.execute(
        "CREATE TABLE tableAkun(id INTEGER PRIMARY KEY AUTO_INCREMENT, nama TEXT, username TEXT, password TEXT");
  }
}