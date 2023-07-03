import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';

abstract class TicketsRepository {
  Future<List<Ticket>> getTicketByUsuario(int idUsuario);

  Future<Ticket> atenderTicket(Ticket ticket);

  Future<Ticket> cancelarTicker(Ticket ticket);
}
