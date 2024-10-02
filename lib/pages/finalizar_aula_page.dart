// import 'package:flutter/material.dart';
// import 'package:monitoramento_2t/models/aula.dart';
// import 'package:monitoramento_2t/services/api_service.dart';
// import 'package:monitoramento_2t/services/database_service.dart';

// class FinalizarAulaPage extends StatefulWidget {
//   final Aula aula;

//   FinalizarAulaPage({required this.aula});

//   @override
//   _FinalizarAulaPageState createState() => _FinalizarAulaPageState();
// }

// class _FinalizarAulaPageState extends State<FinalizarAulaPage> {
//   final _kmFinalController = TextEditingController();
//   final _apiService = ApiService(); // Instância do serviço de API
//   final _databaseService = DatabaseService(); // Instância do serviço de banco de dados

//   Future<void> _finalizarAula() async {
//     final kmFinalText = _kmFinalController.text;
    
//     if (kmFinalText.isNotEmpty) {
//       final kmFinal = double.tryParse(kmFinalText);
//       if (kmFinal == null) {
//         // Exibir erro se a quilometragem final não for um número válido
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Digite uma quilometragem final válida.')),
//         );
//         return;
//       }

//       if (kmFinal <= widget.aula.kmInicial!) {
//         // Exibir erro se a quilometragem final for menor ou igual à inicial
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('A quilometragem final deve ser maior que a inicial.')),
//         );
//         return;
//       }

//       widget.aula.kmFinal = kmFinal;
//       widget.aula.finalizada = true;

//       try {
//         // Dados que serão enviados para a API
//         Map<String, dynamic> dadosAula = {
//           'kmInicial': widget.aula.kmInicial,
//           'kmFinal': widget.aula.kmFinal,
//           'finalizada': widget.aula.finalizada,
//         };

//         // Chamar API para finalizar a aula
//         await _apiService.finalizarAula(widget.aula.id!, dadosAula);

//         // Salvar a aula no banco de dados local
//         await _databaseService.updateAula(widget.aula);

//         // Exibir feedback de sucesso
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Aula finalizada com sucesso!')),
//         );

//         // Voltar para a tela inicial após finalizar
//         Navigator.popUntil(context, ModalRoute.withName('/'));
//       } catch (e) {
//         print('Erro ao finalizar aula: $e');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Erro ao finalizar a aula. Tente novamente.')),
//         );
//       }
//     } else {
//       // Exibir erro se o campo de quilometragem estiver vazio
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Por favor, insira a quilometragem final.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Finalizar Aula')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _kmFinalController,
//               decoration: InputDecoration(labelText: 'Quilometragem Final'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _finalizarAula,
//               child: Text('Finalizar Aula'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
