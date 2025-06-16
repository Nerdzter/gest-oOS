import 'package:flutter/material.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.person_add),
                label: Text("Novo Cliente"),
                onPressed: () {
                  // TODO: abrir tela/campo para novo cadastro
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Exemplo, depois será a lista de clientes Firestore
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Nome do Cliente $index'),
                    subtitle: Text('Telefone: (99) 99999-9999'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Editar cliente
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
