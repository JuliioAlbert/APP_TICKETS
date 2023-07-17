import 'estatus.dart';

class IAccount {
  final int id;
  final String name;
  final String correo;
  final int rol;
  final String token;
  final String cel;
  final int cia;
  final int pla;
  final Estatus? estatus;
  final String userName;

  IAccount({
    required this.id,
    required this.name,
    required this.correo,
    required this.rol,
    required this.token,
    required this.cel,
    required this.cia,
    required this.pla,
    required this.estatus,
    required this.userName,
  });
}
