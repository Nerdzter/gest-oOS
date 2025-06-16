class UserModel {
  final String id;
  final String nome;
  final String email;
  final String cargo; // admin, atendente, tecnico
  final bool ativo;

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.cargo,
    required this.ativo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cargo': cargo,
      'ativo': ativo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      cargo: map['cargo'],
      ativo: map['ativo'],
    );
  }
}
