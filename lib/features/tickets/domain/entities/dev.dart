import './entities.dart';

class Dev {
  final int idUsuario;
  final String nombreUsuario;
  final String appUsuario;
  final String apmUsuario;
  final String email;
  final String? user;
  final String password;
  final Status estatus;
  final TipoUsuario tipoUsuario;

  Dev({
    required this.idUsuario,
    required this.nombreUsuario,
    required this.appUsuario,
    required this.apmUsuario,
    required this.email,
    this.user,
    required this.password,
    required this.estatus,
    required this.tipoUsuario,
  });
}
