import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/widgets.dart';

class AtendidosScreen extends ConsumerWidget {
  static const String name = "atendidos";
  const AtendidosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketsAtendidosListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const HeaderTitle(title: "Atendidos"),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(ticketsProvider.notifier).getTickets(),
        child: TicketsList(
          tickets: tickets,
          disable: true,
        ),
      ),
    );
  }
}
