import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';

abstract class TicketsDataSource {
  Future<Ticket> getTicketById(int idTicket);

  Future<List<Ticket>> getTicketByUsuario(int idUsuario);

  Future<Ticket> atenderTicket(int idTicket, String solucion);

  Future<Ticket> cancelarTicker(int idTicket);

  Future<List<Dev>> getDevsAll();

  Future<Ticket> reasignarTicket(int idTicket, int idDev);
}
