import 'package:flutter/material.dart';

class OSDetailPage extends StatelessWidget {
  const OSDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes da OS')),
      body: Center(child: Text('Detalhes da Ordem de Serviço')),
    );
  }
}
