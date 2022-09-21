import 'package:flutter_one/http_post_method/http_post_model.dart';
import 'package:flutter_one/sqlite/sqlite_model/sqlite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL, age INTEGER NOT NULL, description TEXT NOT NULL, email TEXT)',
    );
  }

  Future<SqliteNoteModel> insert(SqliteNoteModel sqliteNoteModel) async {
    var dbClient = await db;
    await dbClient!.insert('notes', sqliteNoteModel.toMap());
    return sqliteNoteModel;
  }

  Future<List<SqliteNoteModel>> showList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('notes');
    return queryResult.map((e) => SqliteNoteModel.fromMap(e)).toList();
  }

  Future<int> deleteData(int id) async {
    var dbClient = await db;
    // final dltData =
    //     await dbClient!.delete('notes', where: 'id?', whereArgs: [id]);
    return await dbClient!.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  updateData(SqliteNoteModel sqliteNoteModel) async {
    var dbClient = await db;
    return await dbClient!.update('notes', sqliteNoteModel.toMap(),
        where: 'id = ?', whereArgs: [sqliteNoteModel.id]);
  }
}
