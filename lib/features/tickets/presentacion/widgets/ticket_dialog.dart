import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gen_soportes/features/tickets/domain/domain.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/tickets_provider.dart';

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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Atencion(
            ticket: widget.ticket,
            title: widget.ticket.descripcion,
            data: HtmlWidget(widget.ticket.data ?? "Sin descripción"),
          )
        ],
      ),
    );
  }
}

class Atencion extends ConsumerStatefulWidget {
  final Ticket ticket;
  final Widget? data;
  final String title;

  const Atencion({
    required this.ticket,
    super.key,
    this.data,
    required this.title,
  });

  @override
  AtencionState createState() => AtencionState();
}

class AtencionState extends ConsumerState<Atencion> {
  final controller = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void validateAndSubmit() {
    final FormState form = key.currentState!;
    if (form.validate()) {
      ref
          .read(ticketsProvider.notifier)
          .atender(widget.ticket.idTicket, controller.value.text);

      Navigator.pop(context);

      ScaffoldMessenger.of(context).clearSnackBars();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ticket Atendido")),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Revisa tu respuesta")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 30),
        if (widget.data != null)
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: 400,
            ),
            child: SingleChildScrollView(
              child: widget.data,
            ),
          ),
        const SizedBox(height: 20),
        if (widget.ticket.idStatus.idEstatus == 2 ||
            widget.ticket.idStatus.idEstatus == 1)
          Form(
            key: key,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: controller,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Solución",
                  hintStyle: TextStyle(fontSize: 12),
                ),
                validator: (value) {
                  if (value == null || value.length <= 6) {
                    return "Describe un poco más tu solución";
                  }
                  return null;
                }),
          ),
        const SizedBox(height: 30),
        if (widget.ticket.idStatus.idEstatus == 2 ||
            widget.ticket.idStatus.idEstatus == 1)
          Container(
            alignment: Alignment.center,
            child: FilledButton.icon(
              onPressed: validateAndSubmit,
              icon: const Icon(Icons.save),
              label: const Text("Atender"),
            ),
          ),
        if (widget.ticket.servicio?.solucion != null)
          Container(
            color: const Color.fromARGB(255, 255, 230, 0),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.ticket.servicio!.solucion!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ),
          )
      ],
    );
  }
}
