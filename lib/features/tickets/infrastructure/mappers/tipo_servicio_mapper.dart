import '../../domain/entities/entities.dart';

class TipoServicioMapper {
  static jsonToEntity(Map<String, dynamic> json) => TipoServicio(
        idTipoServicio: json["IdTipoServicio"],
        nombreTipoServicio: json["NombreTipoServicio"],
      );
}
