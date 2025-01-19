import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_helper.g.dart';

const _dbName = 'todo_app.db';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    final path = await getDatabasesPath();
    _database = await openDatabase('$path/$_dbName', onCreate: (db, version) async {
      await db.execute(
        '''
          CREATE TABLE todo_items(
            id TEXT PRIMARY KEY,
            title TEXT,
            is_completed INTEGER,
            due_date_time TEXT
          )
        ''',
      );
    }, version: 1);
    return _database!;
  }
}

@Riverpod(keepAlive: true)
DatabaseHelper databaseHelper(Ref ref) => DatabaseHelper();
