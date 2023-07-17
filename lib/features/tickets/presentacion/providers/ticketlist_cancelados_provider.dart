import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';

import '../../domain/entities/ticket.dart';

final ticketListCanceladosProvider = Provider<List<Ticket>>((ref) {
  final ticketPendientes = ref.watch(ticketsProvider).ticketsCancelados;

  if (ticketPendientes.isEmpty) return [];

  return ticketPendientes;
});
