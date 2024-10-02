import 'package:flutter/material.dart';
import 'package:monitoramento_2t/pages/aulas_page.dart';
import 'package:monitoramento_2t/pages/login_page.dart';
import 'package:monitoramento_2t/pages/monitoramento_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autoescola App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Definindo as rotas globais do aplicativo
      initialRoute: '/',
      routes: {
        // '/': (context) => LoginPage(), // Rota inicial para a página de login
        // '/aulas': (context) => AulasPage(), // Rota para a listagem de aulas
        '/': (context) => MonitoramentoPage(), // Rota para monitoramento Bluetooth
      },
    );
  }
}
