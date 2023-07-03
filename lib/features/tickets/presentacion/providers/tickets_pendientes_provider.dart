import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/domain.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/tickets_repository_provider.dart';

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

  initState() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true);

    var tickets = await ticketsRepository.getTicketByUsuario(17);

    state = state.copyWith(ticketsPendientes: tickets);
  }
}

class TicketsState {
  final List<Ticket> ticketsPendientes;
  final List<Ticket> ticketsAtendidos;
  final List<Ticket> ticketsCancelados;
  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;

  TicketsState({
    this.ticketsAtendidos = const [],
    this.ticketsCancelados = const [],
    this.ticketsPendientes = const [],
    this.isLastPage = false,
    this.limit = 10,
    this.offset = 0,
    this.isLoading = false,
  });

  TicketsState copyWith({
    List<Ticket>? ticketsPendientes,
    List<Ticket>? ticketsAtendidos,
    List<Ticket>? ticketsCancelados,
    bool? isLastPage,
    int? limit,
    int? offset,
    bool? isLoading,
  }) =>
      TicketsState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        isLoading: isLoading ?? this.isLoading,
        ticketsAtendidos: ticketsAtendidos ?? this.ticketsAtendidos,
        ticketsCancelados: ticketsCancelados ?? this.ticketsCancelados,
        ticketsPendientes: ticketsPendientes ?? this.ticketsPendientes,
      );
}
