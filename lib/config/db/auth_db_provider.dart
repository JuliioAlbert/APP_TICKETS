import 'package:gen_soportes/features/auth/domain/entities/entities.dart';
import 'package:gen_soportes/features/auth/infrastructure/mappers/auth_mapper.dart';
import './db.dart';

abstract class AuthDBProvider {
  static Future<IAccount?> getAuth() async {
    final db = await DBProvider.db.database;
    final query = await db.query('AUTH');

    return query.isNotEmpty ? AuthMappert.jsonToEntity(query.first) : null;
  }

  static Future<void> saveAuth(Map<String, dynamic> data) async {
    final db = await DBProvider.db.database;
    final respdb = await db.query('AUTH');

    if (respdb.isNotEmpty) {
      await db.delete('AUTH');
      await db.insert('AUTH', data);
    } else {
      await db.insert('AUTH', data);
    }
  }

  static Future<void> deleteAuth() async {
    final db = await DBProvider.db.database;

    final auth = await getAuth();
    if (auth != null) await db.delete('AUTH');
  }
}
