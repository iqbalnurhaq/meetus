import 'package:meetus/data/models/user_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblUser = 'user';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/meetus.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblUser (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        role TEXT,
        avatar TEXT,
        profession TEXT
      );
    ''');
  }

  Future<int> insertUser(UserTable user) async {
    final db = await database;
    return await db!.insert(_tblUser, user.toJson());
  }

  Future<Map<String, dynamic>?> getUser() async {
    final db = await database;
    final result = await db!.query(_tblUser);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
