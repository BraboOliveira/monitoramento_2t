class Instrutor {
  final String cpf;  // CPF do instrutor
  final String nome;  // Nome do instrutor

  Instrutor({required this.cpf, required this.nome});

  // Converter Instrutor para Map (para salvar no banco de dados ou enviar para a API)
  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'nome': nome,
    };
  }

  // Criar Instrutor a partir de JSON (para integração com a API)
  factory Instrutor.fromJson(Map<String, dynamic> json) {
    return Instrutor(
      cpf: json['cpf'],
      nome: json['nome'],
    );
  }
}
