import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/tickets_provider.dart';

final ticketsPendientesListProvider = Provider<List<Ticket>>((ref) {
  final pendientes = ref.watch(ticketsProvider);

  if (pendientes.ticketsPendientes.isEmpty) return [];

  return pendientes.ticketsPendientes;
});
