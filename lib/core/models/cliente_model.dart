class ClienteModel {
  final String id;
  final String nome;
  final String telefone;
  final String? cpf;
  final String? endereco;

  ClienteModel({
    required this.id,
    required this.nome,
    required this.telefone,
    this.cpf,
    this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'cpf': cpf,
      'endereco': endereco,
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      id: map['id'],
      nome: map['nome'],
      telefone: map['telefone'],
      cpf: map['cpf'],
      endereco: map['endereco'],
    );
  }
}
