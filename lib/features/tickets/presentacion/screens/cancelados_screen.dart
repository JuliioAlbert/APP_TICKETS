import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/ticketlist_cancelados_provider.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/widgets.dart';

class CanceladosScreen extends StatelessWidget {
  static const String name = "cancelados_screen";
  const CanceladosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderTitle(title: "Cancelados"),
      ),
      body: const _View(),
    );
  }
}

class _View extends ConsumerWidget {
  const _View();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickets = ref.watch(ticketListCanceladosProvider);

    return TicketsList(
      tickets: tickets,
      disable: true,
    );
  }
}
