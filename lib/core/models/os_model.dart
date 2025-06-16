class OSModel {
  final String id;
  final String clienteId;
  final String aparelho;
  final String marca;
  final String cor;
  final String defeito;
  final String status;
  final double? valor;
  final DateTime dataCriacao;
  final String tecnicoId;

  OSModel({
    required this.id,
    required this.clienteId,
    required this.aparelho,
    required this.marca,
    required this.cor,
    required this.defeito,
    required this.status,
    this.valor,
    required this.dataCriacao,
    required this.tecnicoId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'aparelho': aparelho,
      'marca': marca,
      'cor': cor,
      'defeito': defeito,
      'status': status,
      'valor': valor,
      'dataCriacao': dataCriacao.toIso8601String(),
      'tecnicoId': tecnicoId,
    };
  }

  factory OSModel.fromMap(Map<String, dynamic> map) {
    return OSModel(
      id: map['id'],
      clienteId: map['clienteId'],
      aparelho: map['aparelho'],
      marca: map['marca'],
      cor: map['cor'],
      defeito: map['defeito'],
      status: map['status'],
      valor: map['valor'] != null ? map['valor'].toDouble() : null,
      dataCriacao: DateTime.parse(map['dataCriacao']),
      tecnicoId: map['tecnicoId'],
    );
  }
}
