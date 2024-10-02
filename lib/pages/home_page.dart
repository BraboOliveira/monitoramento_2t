import 'package:flutter/material.dart';
import 'package:monitoramento_2t/models/aula.dart';

class MonitoramentoPage extends StatefulWidget {
  final Aula? aula;

  MonitoramentoPage({this.aula});

  @override
  _MonitoramentoPageState createState() => _MonitoramentoPageState();
}

class _MonitoramentoPageState extends State<MonitoramentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoramento')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.aula != null
                ? Text('Aluno: ${widget.aula!.alunoNome}')
                : Text('Nenhuma aula selecionada.'),
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar monitoramento
              },
              child: Text('Iniciar Monitoramento'),
            ),
          ],
        ),
      ),
    );
  }
}
