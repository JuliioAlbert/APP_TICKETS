import './mappers.dart';
import '../../domain/entities/entities.dart';

class PlaMapper {
  static jsonToEntity(Map<String, dynamic> json) => Pla(
        idPlanta: json["IdPlanta"],
        nombrePlanta: json["NombrePlanta"],
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
        plantaMaster: json["PlantaMaster"],
      );
}
