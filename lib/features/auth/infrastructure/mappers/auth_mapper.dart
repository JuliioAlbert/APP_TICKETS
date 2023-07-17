import './mapperts.dart';
import "../../domain/entities/entities.dart";

class AuthMappert {
  static jsonToEntity(Map<String, dynamic> json) => IAccount(
        id: json["Id"],
        name: json["Name"],
        correo: json["Correo"],
        rol: json["Rol"],
        token: json["Token"],
        cel: json["Cel"],
        cia: json["Cia"],
        pla: json["Pla"],
        estatus: json["Estatus"] != null
            ? EstatusMapper.jsonToEntity(json["Estatus"])
            : null,
        userName: json["UserName"],
      );

  static Map<String, dynamic> entityToJson(IAccount entity) => {
        "Id": entity.id,
        "Name": entity.name,
        "Correo": entity.correo,
        "Rol": entity.rol,
        "Token": entity.token,
        "Cel": entity.cel,
        "Cia": entity.cia,
        "Pla": entity.pla,
        "UserName": entity.userName,
      };
}
