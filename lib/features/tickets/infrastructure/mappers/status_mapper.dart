import '../../domain/entities/entities.dart';

class StatusMapper {
  static jsonToEntity(Map<String, dynamic> json) => Status(
        idEstatus: json["IdEstatus"],
        nombreEstatus: json["NombreEstatus"],
      );
}
