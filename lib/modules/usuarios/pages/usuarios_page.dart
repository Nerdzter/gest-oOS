import 'package:flutter/material.dart';

class UsuariosPage extends StatelessWidget {
  const UsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.person_add_alt_1),
                label: Text("Novo Usuário"),
                onPressed: () {
                  // TODO: abrir tela/campo para novo cadastro
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Exemplo, depois será lista do Firestore
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Usuário $index'),
                    subtitle: Text('Cargo: Técnico'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Editar usuário
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
