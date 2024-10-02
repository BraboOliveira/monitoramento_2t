// import 'package:flutter/material.dart';
// import '../models/aula.dart';
// import 'monitoramento_page.dart';

// class AulasPage extends StatelessWidget {
//   final List<Aula> aulas;

//   AulasPage({required this.aulas});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Aulas do Dia')),
//       body: ListView.builder(
//         itemCount: aulas.length,
//         itemBuilder: (context, index) {
//           final aula = aulas[index];

//           return Card(
//             child: ListTile(
//               title: Text('Aluno: ${aula.alunoNome}'),
//               subtitle: Text('Horário: ${aula.horario}'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MonitoramentoPage(aula: aula),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
