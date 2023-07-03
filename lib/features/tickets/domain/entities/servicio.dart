import './entities.dart';

class Servicio {
  final int idServicio;
  final DateTime fechaHoraRegistro;
  final String nombreUsuario;
  final String requerimiento;
  final String? solucion;
  final DateTime? fechaHoraCierre;
  final Status estatus;
  final Pla planta;
  final TipoServicio? tipoServicio;
  final Dev usuario;
  final Area area;
  final bool temaSistemas;

  Servicio({
    required this.idServicio,
    required this.fechaHoraRegistro,
    required this.nombreUsuario,
    required this.requerimiento,
    this.solucion,
    this.fechaHoraCierre,
    required this.estatus,
    required this.planta,
    this.tipoServicio,
    required this.usuario,
    required this.area,
    required this.temaSistemas,
  });
}
