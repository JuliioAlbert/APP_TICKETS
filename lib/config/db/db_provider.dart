import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database = Database as Database;
  static final DBProvider db = DBProvider._();

  static const _databaseName = "soportes.db";
  static const _databaseVersion = 2;

  DBProvider._();

  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    // var databasesPath = await getDatabasesPath();
    // final path = join(databasesPath, 'gendroid-fugas.db');

    return await openDatabase(path, version: _databaseVersion, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
                CREATE TABLE IF NOT EXISTS AUTH(
                  Id INTEGER,
                  Name TEXT,
                  Correo TEXT,
                  Rol INTEGER,
                  Token TEXT,
                  Cel TEXT,
                  Cia INTEGER,
                  Pla INTEGER,
                  UserName TEXT
                  );
                ''');
    });
  }
}
