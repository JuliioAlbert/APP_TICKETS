import 'package:gen_soportes/features/tickets/domain/domain.dart';

class TicketRepositoryImp extends TicketsRepository {
  final TicketsDataSource dataSource;

  TicketRepositoryImp(this.dataSource);

  @override
  Future<Ticket> atenderTicket(Ticket ticket) {
    return dataSource.atenderTicket(ticket);
  }

  @override
  Future<Ticket> cancelarTicker(Ticket ticket) {
    return dataSource.cancelarTicker(ticket);
  }

  @override
  Future<List<Ticket>> getTicketByUsuario(int idUsuario) {
    return dataSource.getTicketByUsuario(idUsuario);
  }
}
