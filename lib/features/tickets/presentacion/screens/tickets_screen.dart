import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/shared/infrastructure/widgets/drawer.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/widgets.dart';

class TicketsScreen extends ConsumerStatefulWidget {
  static const String name = "ticket_screen";

  const TicketsScreen({super.key});

  @override
  TicketsScreenState createState() => TicketsScreenState();
}

class TicketsScreenState extends ConsumerState<TicketsScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(ticketsProvider.notifier).initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    final tickets = ref.watch(ticketsPendientesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const HeaderTitle(title: "Pendientes"),
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: RefreshIndicator(
        onRefresh: () => ref.read(ticketsProvider.notifier).getTickets(),
        child: TicketsList(tickets: tickets),
      ),
    );
  }
}
