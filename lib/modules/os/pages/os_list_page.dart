import 'package:flutter/material.dart';

class OSListPage extends StatelessWidget {
  const OSListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ordens de Serviço')),
      body: Center(child: Text('Lista de OS aqui')),
    );
  }
}
