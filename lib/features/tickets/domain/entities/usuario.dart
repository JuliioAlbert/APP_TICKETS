import './entities.dart';

class Usuario {
  final int idUt;
  final int usrUt;
  final String pasUt;
  final String nomUt;
  final Pla plaUt;
  final int ciaUt;
  final EmpUt empUt;
  final AdminUT admUt;
  final String celUt;
  final String corUt;
  final dynamic tokUt;
  final DateTime fhrUt;
  final DateTime fhuUt;
  final Status estatus;
  final String usNUt;

  Usuario({
    required this.idUt,
    required this.usrUt,
    required this.pasUt,
    required this.nomUt,
    required this.plaUt,
    required this.ciaUt,
    required this.empUt,
    required this.admUt,
    required this.celUt,
    required this.corUt,
    this.tokUt,
    required this.fhrUt,
    required this.fhuUt,
    required this.estatus,
    required this.usNUt,
  });
}
