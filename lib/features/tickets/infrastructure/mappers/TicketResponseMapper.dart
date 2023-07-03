import '../../domain/entities/entities.dart';
import './mappers.dart';

// List<Ticket> ticketResponseFromJson(String str) =>
//     List<Ticket>.from(json.decode(str).map((x) => Ticket.fromJson(x)));

class TicketMapper {
  static Ticket jsonToEntity(Map<String, dynamic> json) => Ticket(
        idTicket: json["Id_ticket"],
        idUsuario: UsuarioMapper.jsonToEntity(json["Id_usuario"]),
        idDev: DevMapper.jsonToEntity(json["Id_dev"]),
        idStatus: StatusMapper.jsonToEntity(json["Id_status"]),
        descripcion: json["Descripcion"],
        data: json["Data"],
        areas: AreaMapper.jsonToEntity(json["Areas"]),
        enviado: json["Enviado"],
        servicio: json["Servicio"] == null
            ? null
            : ServicioMapper.jsonToEntity(json["Servicio"]),
        fechaRegistro: DateTime.parse(json["FechaRegistro"]),
        fechaAtencion: json["FechaAtencion"] == null
            ? null
            : DateTime.parse(json["FechaAtencion"]),
      );
}
