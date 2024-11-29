import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/pengguna.dart';

class DatabaseInstance {
  final String _databaseName = 'my_database.db';
  final int _databaseVersion = 1;

  // Singleton pattern
  DatabaseInstance._privateConstructor();
  static final DatabaseInstance instance = DatabaseInstance._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pengguna (
        username TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertPengguna(Pengguna pengguna) async {
    final db = await database;
    await db.insert(
      'pengguna', // Pastikan nama tabel konsisten
      pengguna.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Pengguna>> getPengguna() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pengguna'); // Pastikan nama tabel konsisten

    return List.generate(maps.length, (i) {
      return Pengguna.fromMap(maps[i]);
    });
  }

 Future<Pengguna?> getUserData() async {
  final db = await DatabaseInstance.instance.database;
  final List<Map<String, dynamic>> maps = await db.query('pengguna');

  if (maps.isNotEmpty) {
    return Pengguna.fromMap(maps.first);
  }
  return null; 
}

  Future<void> deletePengguna(String email) async {
    final db = await database;
    await db.delete(
      'pengguna', // Pastikan nama tabel konsisten
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  Future<void> saveUSer (String username, String email, String password) async {
    final pengguna = Pengguna(username: username, email: email, password: password);
    await insertPengguna(pengguna);
  }
}