import './mappers.dart';
import '../../domain/entities/entities.dart';

class UsuarioMapper {
  static jsonToEntity(Map<String, dynamic> json) => Usuario(
        idUt: json["Id_ut"],
        usrUt: json["Usr_ut"],
        pasUt: json["Pas_ut"],
        nomUt: json["Nom_ut"],
        plaUt: PlaMapper.jsonToEntity(json["Pla_ut"]),
        ciaUt: json["Cia_ut"],
        empUt: EmpUtMapper.jsonToEntity(json["Emp_ut"]),
        admUt: AdminUtMapper.jsonToEntity(json["Adm_ut"]),
        celUt: json["Cel_ut"],
        corUt: json["Cor_ut"],
        tokUt: json["Tok_ut"],
        fhrUt: DateTime.parse(json["Fhr_ut"]),
        fhuUt: DateTime.parse(json["Fhu_ut"]),
        estatus: StatusMapper.jsonToEntity(json["Estatus"]),
        usNUt: json["UsN_ut"],
      );
}
