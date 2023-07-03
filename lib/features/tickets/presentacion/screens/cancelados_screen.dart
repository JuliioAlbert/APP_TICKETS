import 'package:flutter/material.dart';

class CanceladosScreen extends StatelessWidget {
  static const String name = "cancelados_screen";
  const CanceladosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("Cancelados")),
    );
  }
}
