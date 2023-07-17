import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/tickets_provider.dart';

final ticketsAtendidosListProvider = Provider<List<Ticket>>((ref) {
  final atendidos = ref.watch(ticketsProvider);

  if (atendidos.ticketsAtendidos.isEmpty) return [];

  return atendidos.ticketsAtendidos;
});
