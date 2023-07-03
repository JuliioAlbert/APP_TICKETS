import './mappers.dart';
import '../../domain/entities/entities.dart';

class AreaMapper {
  static jsonToEntity(Map<String, dynamic> json) => Area(
        idArea: json["IdArea"],
        nombreArea: json["NombreArea"],
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
      );
}
