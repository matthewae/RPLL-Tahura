import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/pengguna.dart';


class DatabaseInstance {
  final String _databaseName = 'my_database.db';
  final int _databaseVersion = 1;

  // Singleton pattern
  DatabaseInstance._privateConstructor();
  static final DatabaseInstance instance =
      DatabaseInstance._privateConstructor();

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

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pengguna (
        username TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE pengelola (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        password TEXT NOT NULL
      )
    ''');

    // await db.execute('''
    //   CREATE TABLE sepeda (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     nama TEXT NOT NULL,
    //     harga REAL NOT NULL,
    //     stok INTEGER NOT NULL
    //   )
    // ''');
  }

  // DATABASE PENGGUNA
  Future<void> insertPengguna(Pengguna pengguna) async {
    final db = await database;
    await db.insert(
      'pengguna',
      pengguna.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Pengguna>> getPengguna() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pengguna');
    return maps.map((map) => Pengguna.fromMap(map)).toList();
  }

  Future<void> deletePengguna(String email) async {
    final db = await database;
    await db.delete(
      'pengguna',
      where: 'email = ?',
      whereArgs: [email],
    );
  }

  Future<Pengguna?> getUserData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('pengguna', limit: 1);

    if (maps.isNotEmpty) {
      return Pengguna.fromMap(maps.first);
    }
    return null;
  }

//   // DATABASE PENGELOLA
//   Future<void> insertPengelola(Pengelola pengelola) async {
//     final db = await database;
//     await db.insert(
//       'pengelola',
//       pengelola.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Pengelola>> getPengelola() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('pengelola');
//     return maps.map((map) => Pengelola.fromMap(map)).toList();
//   }

//   Future<void> deletePengelola(int id) async {
//     final db = await database;
//     await db.delete(
//       'pengelola',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<bool> validatePengelola(String id, String password) async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(
//       'pengelola',
//       where: 'id = ? AND password = ?',
//       whereArgs: [id, password],
//     );
//     return maps.isNotEmpty;
//   }

//   // DATABASE SEPEDA
//   Future<void> insertSepeda(Sepeda sepeda) async {
//     final db = await database;
//     await db.insert(
//       'sepeda',
//       sepeda.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Sepeda>> getSepeda() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('sepeda');
//     return maps.map((map) => Sepeda.fromMap(map)).toList();
//   }

//   Future<void> updateSepeda(Sepeda sepeda) async {
//     final db = await database;
//     await db.update(
//       'sepeda',
//       sepeda.toMap(),
//       where: 'id = ?',
//       whereArgs: [sepeda.id],
//     );
//   }

//   Future<void> deleteSepeda(int id) async {
//     final db = await database;
//     await db.delete(
//       'sepeda',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
}
