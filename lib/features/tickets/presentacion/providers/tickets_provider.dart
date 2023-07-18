import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/config/db/db.dart';
import 'package:gen_soportes/features/tickets/domain/domain.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';

final ticketsProvider = StateNotifierProvider<TicketsNotifier, TicketsState>(
  (ref) {
    final ticketsRepository = ref.watch(ticketRepositoryProvider);

    return TicketsNotifier(ticketsRepository: ticketsRepository);
  },
);

class TicketsNotifier extends StateNotifier<TicketsState> {
  final TicketsRepository ticketsRepository;

  TicketsNotifier({
    required this.ticketsRepository,
  }) : super(TicketsState()) {
    initState();
  }

  getTickets() async {
    final auth = await AuthDBProvider.getAuth();

    var tickets = await ticketsRepository.getTicketByUsuario(auth!.id);

    state = state.copyWith(
      ticketsPendientes: [
        ...tickets.where(
            (t) => t.idStatus.idEstatus == 2 || t.idStatus.idEstatus == 1)
      ],
      ticketsCancelados: [...tickets.where((t) => t.idStatus.idEstatus == 4)],
      ticketsAtendidos: [...tickets.where((t) => t.idStatus.idEstatus == 7)],
    );
  }

  Future<List<Dev>> getDevs() async {
    final devs = await ticketsRepository.getDevsAll();

    state = state.copyWith(devs: devs);

    return devs;
  }

  initState() async {
    getTickets();
  }

  atender(int idTicket, String solucion) async {
    final ticket = await ticketsRepository.atenderTicket(idTicket, solucion);

    state = state.copyWith(
      ticketsAtendidos: [...state.ticketsAtendidos, ticket],
      ticketsPendientes: [
        ...state.ticketsPendientes.where((t) => t.idTicket != ticket.idTicket)
      ],
    );
  }

  //#Cancelar Ticket
  cancelar(int idTicket) async {
    final ticketCancelado = await ticketsRepository.cancelarTicker(idTicket);

    state = state.copyWith(
      ticketsCancelados: [...state.ticketsCancelados, ticketCancelado],
      ticketsPendientes: [
        ...state.ticketsPendientes
            .where((t) => t.idTicket != ticketCancelado.idTicket)
      ],
    );
  }

  selectTicket(Ticket ticket) {
    state = state.copyWith(ticket: ticket, dev: ticket.idDev);
  }

  changeDev(int? dev) {
    state = state.copyWith(
        dev: state.devs.where((element) => element.idUsuario == dev).first);
  }

  reasignarTicket() async {
    final ticket = await ticketsRepository.reasignarTicket(
        state.ticket!.idTicket, state.dev!.idUsuario);

    state = state.copyWith(
      ticketsPendientes: [
        ...state.ticketsPendientes.where((t) => t.idTicket != ticket.idTicket)
      ],
    );
  }
}

class TicketsState {
  final List<Ticket> ticketsPendientes;
  final List<Ticket> ticketsAtendidos;
  final List<Ticket> ticketsCancelados;
  final List<Dev> devs;
  final Ticket? ticket;

  final Dev? dev;

  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;

  TicketsState(
      {this.ticketsAtendidos = const [],
      this.ticketsCancelados = const [],
      this.ticketsPendientes = const [],
      this.isLastPage = false,
      this.limit = 10,
      this.offset = 0,
      this.isLoading = false,
      this.dev,
      this.devs = const [],
      this.ticket});

  TicketsState copyWith({
    List<Ticket>? ticketsPendientes,
    List<Ticket>? ticketsAtendidos,
    List<Ticket>? ticketsCancelados,
    List<Dev>? devs,
    bool? isLastPage,
    int? limit,
    int? offset,
    bool? isLoading,
    Dev? dev,
    Ticket? ticket,
  }) =>
      TicketsState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        isLoading: isLoading ?? this.isLoading,
        ticketsAtendidos: ticketsAtendidos ?? this.ticketsAtendidos,
        ticketsCancelados: ticketsCancelados ?? this.ticketsCancelados,
        ticketsPendientes: ticketsPendientes ?? this.ticketsPendientes,
        dev: dev ?? this.dev,
        devs: devs ?? this.devs,
        ticket: ticket ?? this.ticket,
      );
}
