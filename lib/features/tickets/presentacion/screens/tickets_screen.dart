import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/shared/infrastructure/widgets/drawer.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/tickets_pendientes_provider.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/ticket_dialog.dart';

import '../../domain/entities/ticket.dart';

class TicketsScreen extends StatelessWidget {
  static const String name = "ticket_screen";

  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: const _TicketsView(),
    );
  }
}

class _TicketsView extends ConsumerStatefulWidget {
  const _TicketsView();

  @override
  _TicketsViewState createState() => _TicketsViewState();
}

class _TicketsViewState extends ConsumerState {
  @override
  void initState() {
    super.initState();

    ref.read(ticketsProvider.notifier).initState();
  }

  void openDialog(BuildContext context, Ticket ticket) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TicketDialog(ticket: ticket),
          actions: [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ticketState = ref.watch(ticketsProvider);

    final tickets = ticketState.ticketsPendientes;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Mis Ticket Pendientes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (BuildContext context, int index) {
              final ticket = tickets[index];
              return ListTile(
                title: Text(
                  ticket.descripcion,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                subtitle: Text(
                  ticket.areas.nombreArea,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                trailing: const Icon(Icons.more_horiz_outlined),
                onTap: () => openDialog(context, ticket),
              );
            },
          ),
        ),
      ],
    );
  }
}
