
import 'package:flutter/material.dart';

class AtendidosScreen extends StatelessWidget {
  static const String name = "atendidos";
  const AtendidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Atendidos")),
    );
  }
}
