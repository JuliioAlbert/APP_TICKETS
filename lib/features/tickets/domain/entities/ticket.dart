import './entities.dart';

class Ticket {
  final int idTicket;
  final Usuario idUsuario;
  final Dev idDev;
  final Status idStatus;
  final String descripcion;
  final String? data;
  final Area areas;
  final bool enviado;
  final Servicio? servicio;
  final DateTime fechaRegistro;
  final DateTime? fechaAtencion;

  Ticket({
    required this.idTicket,
    required this.idUsuario,
    required this.idDev,
    required this.idStatus,
    required this.descripcion,
    this.data,
    required this.areas,
    required this.enviado,
    this.servicio,
    required this.fechaRegistro,
    this.fechaAtencion,
  });
}
