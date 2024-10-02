class AulaAcao {
  final int? id;  // ID da ação no banco de dados
  final int aulaId;  // Relacionamento com a aula
  final DateTime timestamp;  // Data e hora em que a ação foi realizada
  final bool freioLigado;  // Status do freio
  final bool setaDireita;  // Status da seta direita
  final bool setaEsquerda;  // Status da seta esquerda
  final bool freioMao;  // Status do freio de mão
  final bool cintoSeguranca;  // Status do cinto de segurança

  AulaAcao({
    this.id,
    required this.aulaId,
    required this.timestamp,
    required this.freioLigado,
    required this.setaDireita,
    required this.setaEsquerda,
    required this.freioMao,
    required this.cintoSeguranca,
  });

  // Converter AulaAcao para Map (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aulaId': aulaId,
      'timestamp': timestamp.toIso8601String(),
      'freioLigado': freioLigado ? 1 : 0,
      'setaDireita': setaDireita ? 1 : 0,
      'setaEsquerda': setaEsquerda ? 1 : 0,
      'freioMao': freioMao ? 1 : 0,
      'cintoSeguranca': cintoSeguranca ? 1 : 0,
    };
  }

  // Criar AulaAcao a partir de um Map (para leitura do banco de dados)
  factory AulaAcao.fromMap(Map<String, dynamic> map) {
    return AulaAcao(
      id: map['id'],
      aulaId: map['aulaId'],
      timestamp: DateTime.parse(map['timestamp']),
      freioLigado: map['freioLigado'] == 1,
      setaDireita: map['setaDireita'] == 1,
      setaEsquerda: map['setaEsquerda'] == 1,
      freioMao: map['freioMao'] == 1,
      cintoSeguranca: map['cintoSeguranca'] == 1,
    );
  }

  // Criar AulaAcao a partir de JSON (para integração com a API)
  factory AulaAcao.fromJson(Map<String, dynamic> json) {
    return AulaAcao(
      id: json['id'],
      aulaId: json['aulaId'],
      timestamp: DateTime.parse(json['timestamp']),
      freioLigado: json['freioLigado'] == true,
      setaDireita: json['setaDireita'] == true,
      setaEsquerda: json['setaEsquerda'] == true,
      freioMao: json['freioMao'] == true,
      cintoSeguranca: json['cintoSeguranca'] == true,
    );
  }
}
