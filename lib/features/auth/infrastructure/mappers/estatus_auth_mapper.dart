import "../../domain/entities/entities.dart";

class EstatusMapper {
  static jsonToEntity(Map<String, dynamic> json) => Estatus(
        idEstatus: json["IdEstatus"],
        nombreEstatus: json["NombreEstatus"],
      );
}
