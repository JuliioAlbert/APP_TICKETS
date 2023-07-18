import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/widgets.dart';

class CanceladosScreen extends ConsumerWidget {
  static const String name = "cancelados_screen";
  const CanceladosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketListCanceladosProvider);

    return Scaffold(
        appBar: AppBar(
          title: const HeaderTitle(title: "Cancelados"),
        ),
        body: RefreshIndicator(
          child: TicketsList(
            tickets: tickets,
            disable: true,
          ),
          onRefresh: () => ref.read(ticketsProvider.notifier).getTickets(),
        ));
  }
}
