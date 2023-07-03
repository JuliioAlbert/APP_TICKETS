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
        estatus: EstatusMapper.jsonToEntity(json["Estatus"]),
        userName: json["UserName"],
      );
}
