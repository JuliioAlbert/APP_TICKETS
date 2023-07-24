import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';
import 'package:gen_soportes/features/tickets/presentacion/widgets/widgets.dart';

class TicketsList extends ConsumerWidget {
  final List<Ticket> tickets;
  final bool? disable;

  const TicketsList({
    super.key,
    required this.tickets,
    this.disable = false,
  });

  void openDialog(BuildContext context, Ticket ticket) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TicketDialog(ticket: ticket),
        );
      },
    );
  }

  void openDialogLong(
      BuildContext context, Ticket ticket, WidgetRef ref, Dev? dev) {
    if (ticket.idStatus?.idEstatus == 1 || ticket.idStatus?.idEstatus == 2) {
      showModalBottomSheet(
        context: context,
        elevation: 10,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: const Text(
                  'Cancelar Ticket',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  cancelarTicket(ticket, ref);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.read_more,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Reasignar',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  openDialogReasignar(context, ticket, ref, dev);
                },
              ),
            ],
          ),
        ),
      );

      return;
    }
  }

  void cancelarTicket(Ticket ticket, WidgetRef ref) {
    ref.read(ticketsProvider.notifier).cancelar(ticket.idTicket);
  }

  void openDialogReasignar(
      BuildContext context, Ticket ticket, WidgetRef ref, Dev? dev) {
    Navigator.of(context).pop();
    ref.read(ticketsProvider.notifier).selectTicket(ticket);

    showModalBottomSheet(
      context: context,
      builder: (context) => const ModalReasignar(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dev = ref.watch(ticketsProvider).dev;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (BuildContext context, int index) {
              final ticket = tickets[index];
              return Dismissible(
                background: Container(),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete_forever,
                      color: Colors.white, size: 32),
                ),
                direction: disable!
                    ? DismissDirection.none
                    : DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                  cancelarTicket(ticket, ref);
                },
                key: UniqueKey(),
                child: ListTile(
                  iconColor: ticket.idStatus?.idEstatus == 4
                      ? Colors.red
                      : (ticket.idStatus?.idEstatus == 1 ||
                              ticket.idStatus?.idEstatus == 2)
                          ? Colors.blue
                          : Colors.grey,
                  leading: const Icon(Icons.bug_report_outlined),
                  title: Text(
                    "${ticket.idTicket}-${ticket.descripcion.trimLeft()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ticket.areas!.nombreArea.trimLeft(),
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      if (ticket.servicio?.solucion != null)
                        Text(
                          ticket.servicio!.solucion!,
                          style: const TextStyle(
                            fontSize: 9,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                    ],
                  ),
                  trailing: const Icon(Icons.more_horiz_outlined),
                  onTap: () {
                    openDialog(context, ticket);
                  },
                  onLongPress: () {
                    openDialogLong(context, ticket, ref, dev);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
