import './entities.dart';

class Pla {
  final int idPlanta;
  final String nombrePlanta;
  final Status estatus;
  final dynamic plantaMaster;

  Pla({
    required this.idPlanta,
    required this.nombrePlanta,
    required this.estatus,
    this.plantaMaster,
  });
}
