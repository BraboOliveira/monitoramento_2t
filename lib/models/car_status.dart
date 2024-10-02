class CarStatus {
  final String latitude;
  final String longitude;
  final bool freioLigado;
  final bool setaDireita;
  final bool setaEsquerda;
  final bool freioMao;
  final bool cintoSeguranca;

  CarStatus({
    required this.latitude,
    required this.longitude,
    required this.freioLigado,
    required this.setaDireita,
    required this.setaEsquerda,
    required this.freioMao,
    required this.cintoSeguranca,
  });

  factory CarStatus.fromJson(Map<String, dynamic> json) {
    return CarStatus(
      latitude: json['lat'],
      longitude: json['lon'],
      freioLigado: json['freio'] == "1",
      setaDireita: json['setaDir'] == "1",
      setaEsquerda: json['setaEsq'] == "1",
      freioMao: json['freioMao'] == "1",
      cintoSeguranca: json['cinto'] == "1",
    );
  }
}
