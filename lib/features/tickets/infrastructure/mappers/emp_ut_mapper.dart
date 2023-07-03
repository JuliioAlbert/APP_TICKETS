import '../../domain/entities/entities.dart';

class EmpUtMapper {
  static jsonToEntity(Map<String, dynamic> json) => EmpUt(
        idEmp: json["Id_emp"],
        nomEmp: json["Nom_emp"],
      );
}
