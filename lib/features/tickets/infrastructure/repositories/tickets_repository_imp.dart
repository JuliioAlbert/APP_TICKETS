import 'package:gen_soportes/features/tickets/domain/domain.dart';

class TicketRepositoryImp extends TicketsRepository {
  final TicketsDataSource dataSource;

  TicketRepositoryImp(this.dataSource);

  @override
  Future<List<Ticket>> getTicketByUsuario(int idUsuario) {
    return dataSource.getTicketByUsuario(idUsuario);
  }

  @override
  Future<Ticket> atenderTicket(int idTicket, String solucion) {
    return dataSource.atenderTicket(idTicket, solucion);
  }

  @override
  Future<Ticket> cancelarTicker(int idTicket) {
    return dataSource.cancelarTicker(idTicket);
  }

  @override
  Future<List<Dev>> getDevsAll() {
    return dataSource.getDevsAll();
  }
}
