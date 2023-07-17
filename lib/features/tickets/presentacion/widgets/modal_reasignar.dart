import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';

class ModalReasignar extends ConsumerStatefulWidget {
  const ModalReasignar({
    super.key,
  });

  @override
  ModalReasignarState createState() => ModalReasignarState();
}

class ModalReasignarState extends ConsumerState<ModalReasignar> {
  @override
  void initState() async {
    super.initState();
    ref.read(ticketsProvider.notifier).getDevs();
  }

  @override
  Widget build(BuildContext context) {
    final dev = ref.watch(ticketsProvider);

    return Container(
      width: double.infinity,
      color: Colors.green,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Reasignar Ticket",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          DropdownButton<Dev>(
            icon: const Icon(Icons.arrow_downward),
            hint: const Text("Esto es el Hint"),
            value: dev.dev,
            items: dev.devs
                .map(
                  (e) => DropdownMenuItem<Dev>(
                    value: e,
                    child: Text(e.nombreUsuario),
                  ),
                )
                .toList(),
            onChanged: ref.read(ticketsProvider.notifier).changeDev,
          ),
        ],
      ),
    );
  }
}
