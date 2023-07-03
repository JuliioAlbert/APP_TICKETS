import 'package:flutter/material.dart';
import 'package:gen_soportes/features/tickets/domain/domain.dart';

class TicketDialog extends StatefulWidget {
  final Ticket ticket;

  const TicketDialog({
    super.key,
    required this.ticket,
  });

  @override
  State<TicketDialog> createState() => _TicketDialogState();
}

class _TicketDialogState extends State<TicketDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.ticket.data != null && widget.ticket.data!.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  child: Text(widget.ticket.data ?? "DATA HTML"),
                ),
              )
            ],
          )
        : Container();
  }
}
