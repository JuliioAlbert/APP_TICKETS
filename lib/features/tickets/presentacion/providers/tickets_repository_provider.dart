import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/domain.dart';
import 'package:gen_soportes/features/tickets/infrastructure/datasource/ticket_datasource_imp.dart';
import 'package:gen_soportes/features/tickets/infrastructure/repositories/tickets_repository_imp.dart';

final ticketRepositoryProvider = Provider<TicketsRepository>((ref) {
  final ticketRepository = TicketRepositoryImp(TicketDataSourceImp());

  return ticketRepository;
});
