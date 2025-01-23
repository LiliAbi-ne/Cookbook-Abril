import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tickets.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tickets(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            title TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertTicket(
      String name, String email, String title, String date) async {
    final db = await database;
    return await db.insert('tickets', {
      'name': name,
      'email': email,
      'title': title,
      'date': date,
    });
  }

  Future<List<Map<String, dynamic>>> getTickets() async {
    final db = await database;
    return await db.query('tickets');
  }

  Future<int> deleteTicket(int id) async {
    final db = await database;
    return await db.delete('tickets', where: 'id = ?', whereArgs: [id]);
  }
}
