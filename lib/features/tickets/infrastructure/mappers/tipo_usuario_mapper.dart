import '../../domain/entities/entities.dart';

class TipoUsuarioMapper {
  static jsonToEntity(Map<String, dynamic> json) => TipoUsuario(
        idTipoUsuario: json["IdTipoUsuario"],
        nombreTipoUsuario: json["NombreTipoUsuario"],
      );
}
