import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const _tbEmployees = 'employees';
  static const _tbAttendances = 'teacher_attendances';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/db_mischool_attendance.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tbEmployees (
          id TEXT PRIMARY KEY,
          card_id TEXT,
          name TEXT,
          photo TEXT,
          employee_type TEXT
        )''');
        await db.execute('''CREATE TABLE $_tbAttendances (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          card_id TEXT,
          created_at TEXT
        )''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }
}
