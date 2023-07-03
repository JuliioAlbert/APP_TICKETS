import 'package:gen_soportes/features/tickets/infrastructure/mappers/status_mapper.dart';

import '../../domain/entities/entities.dart';

class AdminUtMapper {
  static jsonToEntity(Map<String, dynamic> json) => AdminUT(
        idPlantaMaster: json["IdPlantaMaster"],
        nombrePlantaMaster: json["NombrePlantaMaster"],
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
      );
}
