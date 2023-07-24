import '../../domain/entities/entities.dart';
import './mappers.dart';

// List<Ticket> ticketResponseFromJson(String str) =>
//     List<Ticket>.from(json.decode(str).map((x) => Ticket.fromJson(x)));

class TicketMapper {
  static Ticket jsonToEntity(Map<String, dynamic> json) => Ticket(
        idTicket: int.parse(json["Id_ticket"].toString()),
        idUsuario: json["Id_usuario"] == null
            ? null
            : UsuarioMapper.jsonToEntity(json["Id_usuario"]),
        idDev: json["Id_dev"] == null
            ? null
            : DevMapper.jsonToEntity(json["Id_dev"]),
        idStatus: json["Id_status"] == null
            ? null
            : StatusMapper.jsonToEntity(json["Id_status"]),
        descripcion: json["Descripcion"],
        data: json["Data"],
        areas: json["Areas"] == null
            ? null
            : AreaMapper.jsonToEntity(json["Areas"]),
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
