// import 'package:flutter/material.dart';
// import 'package:monitoramento_2t/models/aula.dart';
// import 'package:monitoramento_2t/pages/monitoramento_page.dart';
// import 'package:monitoramento_2t/services/database_service.dart';


// class IniciarAulaPage extends StatefulWidget {
//   final Aula aula;

//   IniciarAulaPage({required this.aula});

//   @override
//   _IniciarAulaPageState createState() => _IniciarAulaPageState();
// }

// class _IniciarAulaPageState extends State<IniciarAulaPage> {
//   final _kmInicialController = TextEditingController();

//   void _iniciarAula() {
//     final kmInicial = _kmInicialController.text;
//     if (kmInicial.isNotEmpty) {
//       widget.aula.kmInicial = double.parse(kmInicial);

//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MonitoramentoPage(aula: widget.aula),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Iniciar Aula')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('Aula: ${widget.aula.alunoNome}'),
//             TextField(
//               controller: _kmInicialController,
//               decoration: InputDecoration(labelText: 'Quilometragem Inicial'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _iniciarAula,
//               child: Text('Iniciar Aula'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
