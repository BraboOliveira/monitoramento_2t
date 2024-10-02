import 'package:monitoramento_2t/models/aula_acao.dart';
import 'package:intl/intl.dart';

class Aula {
  final int? id;  
  final String alunoNome;  
  final String instrutorNome;  
  final String horario;  // Horário no formato "yyyy-MM-dd HH:mm:ss"
  double? kmInicial;  
  double? kmFinal;  
  bool finalizada;  

  Aula({
    this.id,
    required this.alunoNome,
    required this.instrutorNome,
    required this.horario,
    this.kmInicial,
    this.kmFinal,
    this.finalizada = false,
  });

  // Método que verifica se a aula está no horário correto
  bool isNoHorario() {
    try {
      // Parse do horário da aula
      DateTime horarioAula = DateFormat("yyyy-MM-dd HH:mm:ss").parse(horario);

      // Hora atual
      DateTime agora = DateTime.now();

      // Você pode ajustar isso dependendo da sua lógica de "estar no horário"
      // Aqui estamos verificando se a hora atual é igual ou após o horário da aula.
      if (agora.isAfter(horarioAula) || agora.isAtSameMomentAs(horarioAula)) {
        return true;
      }
    } catch (e) {
      print('Erro ao verificar o horário: $e');
    }

    return false;
  }

  // Converter Aula para Map (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'alunoNome': alunoNome,
      'instrutorNome': instrutorNome,
      'horario': horario,
      'kmInicial': kmInicial,
      'kmFinal': kmFinal,
      'finalizada': finalizada ? 1 : 0,
    };
  }

  // Criar Aula a partir de um Map (para leitura do banco de dados)
  factory Aula.fromMap(Map<String, dynamic> map) {
    return Aula(
      id: map['id'],
      alunoNome: map['alunoNome'],
      instrutorNome: map['instrutorNome'],
      horario: map['horario'],
      kmInicial: map['kmInicial'],
      kmFinal: map['kmFinal'],
      finalizada: map['finalizada'] == 1,
    );
  }

  // Criar Aula a partir de JSON (para integração com a API)
  factory Aula.fromJson(Map<String, dynamic> json) {
    return Aula(
      id: json['id'],
      alunoNome: json['alunoNome'],
      instrutorNome: json['instrutorNome'],
      horario: json['horario'],
      kmInicial: json['kmInicial'],
      kmFinal: json['kmFinal'],
      finalizada: json['finalizada'] == true,
    );
  }
}
