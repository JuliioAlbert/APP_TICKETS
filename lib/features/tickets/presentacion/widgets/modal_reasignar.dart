import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/features/tickets/domain/entities/entities.dart';
import 'package:gen_soportes/features/tickets/presentacion/providers/providers.dart';

class ModalReasignar extends ConsumerWidget {
  const ModalReasignar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dev = ref.watch(ticketsProvider).dev;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
        // minHeight: 200,
        maxHeight: 250,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                "Reasignar Ticket",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
            FutureBuilder<List<Dev>>(
              future: ref.read(ticketsProvider.notifier).getDevs(),
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton<int>(
                    icon: const Icon(Icons.arrow_downward),
                    value: dev?.idUsuario,
                    items: [
                      ...snapshot.data!.map(
                        (e) => DropdownMenuItem(
                          value: e.idUsuario,
                          child: Text(
                            "${e.nombreUsuario} ${e.appUsuario}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                    onChanged: ref.read(ticketsProvider.notifier).changeDev,
                  );
                } else if (snapshot.hasError) {
                  return Column(children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ]);
                } else {
                  // TODO LOADING
                  return const Column(children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ]);
                }
              },
            ),
            SizedBox(
              width: 300,
              child: FilledButton(
                onPressed: () {
                  ref.read(ticketsProvider.notifier).reasignarTicket();

                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Ticket enviado a ${dev?.nombreUsuario}")));
                },
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: const Text("Guardar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
