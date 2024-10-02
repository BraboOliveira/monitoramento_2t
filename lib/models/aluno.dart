class Aluno {
  final String nome;  // Nome do aluno
  final String documento;  // Documento de identificação (CPF ou outro)

  Aluno({required this.nome, required this.documento});

  // Converter Aluno para Map (para salvar no banco de dados ou enviar para a API)
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'documento': documento,
    };
  }

  // Criar Aluno a partir de JSON (para integração com a API)
  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      nome: json['nome'],
      documento: json['documento'],
    );
  }
}
  