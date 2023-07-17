import './mappers.dart';
import '../../domain/entities/entities.dart';

class DevMapper {
  static Dev jsonToEntity(Map<String, dynamic> json) => Dev(
        idUsuario: json["IdUsuario"],
        nombreUsuario: json["NombreUsuario"] ?? "",
        appUsuario: json["AppUsuario"] ?? "",
        apmUsuario: json["ApmUsuario"] ?? "",
        email: json["Email"] ?? "",
        user: json["User"] ?? "",
        password: json["Password"] ?? "",
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
        tipoUsuario: TipoUsuarioMapper.jsonToEntity(json["TipoUsuario"]),
      );
}
