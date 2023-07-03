import './mappers.dart';
import '../../domain/entities/entities.dart';

class ServicioMapper {
  static jsonToEntity(Map<String, dynamic> json) => Servicio(
        idServicio: json["IdServicio"],
        fechaHoraRegistro: DateTime.parse(json["FechaHoraRegistro"]),
        nombreUsuario: json["NombreUsuario"],
        requerimiento: json["Requerimiento"],
        solucion: json["Solucion"],
        fechaHoraCierre: json["FechaHoraCierre"] == null
            ? null
            : DateTime.parse(json["FechaHoraCierre"]),
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
        planta: PlaMapper.jsonToEntity(json["Planta"]),
        tipoServicio: json["TipoServicio"] == null
            ? null
            : TipoServicioMapper.jsonToEntity(json["TipoServicio"]),
        usuario: DevMapper.jsonToEntity(json["Usuario"]),
        area: AreaMapper.jsonToEntity(json["Area"]),
        temaSistemas: json["TemaSistemas"],
      );
}
