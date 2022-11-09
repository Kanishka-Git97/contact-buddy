import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static const _databaseName = 'ContactBuddy.db';
  static const _databaseVersion = 1;

  //Singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  
}
