import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  final List<String> statusList = [
    'Em Análise',
    'Aguardando Autorização',
    'Autorizado',
    'Pronto',
    'Entregue',
    'Cancelado',
  ];

  // MOCK: Lista de OS para cada status
  final Map<String, List<Map<String, String>>> osPorStatus = {
    'Em Análise': [
      {'cliente': 'João', 'modelo': 'Samsung S22', 'data': '16/06/2025', 'detalhe': 'Troca tela'},
      {'cliente': 'Maria', 'modelo': 'iPhone 13', 'data': '15/06/2025', 'detalhe': 'Troca bateria'},
      {'cliente': 'Kleber', 'modelo': 'Motorola G30', 'data': '12/06/2025', 'detalhe': 'Não liga'},
    ],
    'Aguardando Autorização': [
      {'cliente': 'Pedro', 'modelo': 'Xiaomi Redmi 9', 'data': '15/06/2025', 'detalhe': 'Câmera não funciona'},
    ],
    'Autorizado': [],
    'Pronto': [],
    'Entregue': [],
    'Cancelado': [],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: statusList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _goToDetail(Map<String, String> os) {
    Navigator.pushNamed(context, '/os-detail', arguments: os);
  }

  @override
  Widget build(BuildContext context) {
    double cardHeight = 140; // Altura do card reduzida
    double titleFont = 20;
    double infoFont = 15;

    return Scaffold(
      appBar: AppBar(
        title: Text('Painel Principal'),
        actions: [
          CircleAvatar(child: Icon(Icons.person)),
          SizedBox(width: 12),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(96),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (v) {
                      setState(() => _searchQuery = v);
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar cliente, aparelho, detalhe...',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: statusList.map((s) => Tab(text: s)).toList(),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Gestão OS', style: TextStyle(fontWeight: FontWeight.bold))),
            ListTile(leading: Icon(Icons.home), title: Text('Dashboard'), onTap: () {}),
            ListTile(leading: Icon(Icons.receipt_long), title: Text('Ordens de Serviço'), onTap: () {}),
            ListTile(leading: Icon(Icons.people), title: Text('Clientes'), onTap: () {}),
            ListTile(leading: Icon(Icons.inventory), title: Text('Estoque'), onTap: () {}),
            ListTile(leading: Icon(Icons.admin_panel_settings), title: Text('Usuários'), onTap: () {}),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: statusList.map((status) {
          final osList = osPorStatus[status] ?? [];
          final filteredList = osList.where((os) {
            final q = _searchQuery.toLowerCase();
            return os.values.any((v) => v.toLowerCase().contains(q));
          }).toList();

          if (filteredList.isEmpty) {
            return Center(child: Text('Nenhuma OS para "$status"'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.7, // Card mais baixo
              ),
              itemBuilder: (context, index) {
                final os = filteredList[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Conteúdo principal
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(os['modelo'] ?? '', style: TextStyle(fontSize: titleFont, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Cliente: ${os['cliente']}', style: TextStyle(fontSize: infoFont)),
                              Text('Data: ${os['data']}', style: TextStyle(fontSize: infoFont)),
                              Text('Detalhe: ${os['detalhe']}', style: TextStyle(fontSize: infoFont)),
                            ],
                          ),
                        ),
                        // Botão "Ver mais"
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Ver mais', style: TextStyle(fontSize: 14, color: Colors.blue)),
                                Icon(Icons.arrow_forward, color: Colors.blue),
                              ],
                            ),
                            tooltip: 'Ver mais detalhes',
                            onPressed: () => _goToDetail(os),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação: nova OS
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
