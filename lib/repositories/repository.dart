// import 'package:flutter/cupertino.dart';
import 'package:projek_akhir3/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:async/async.dart';

class Repository {
  DatabaseConnection? _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection!.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection!.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection!.query(table);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection!.update(table, data,
        where: 'idBarang=?', whereArgs: [data['idBarang']]);
  }

  readDataByID(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idBarang=?', whereArgs: [itemId]);
  }

  deleteData(table, itemId) async {
    var connection = await database;
    return await connection!
        .rawDelete("DELETE FROM $table where idBarang=$itemId");
  }
}