// import 'package:flutter/material.dart';
// import 'package:monitoramento_2t/models/aula.dart';
// import 'package:monitoramento_2t/models/controllers/app_controller.dart';


// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _cpfController = TextEditingController();
//   final AppController _appController = AppController();

//   Future<void> _login() async {
//     final cpf = _cpfController.text;
//     if (cpf.isNotEmpty) {
//       try {
//         List<Aula> aulas = await _appController.loginAndFetchAulas(cpf);
//         // Navegar para a página de aulas passando a lista de aulas
//         Navigator.pushNamed(
//           context,
//           '/aulas',
//           arguments: aulas, // Passa a lista de aulas como argumento
//         );
//       } catch (e) {
//         print('Erro: $e');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Erro ao buscar aulas. Tente novamente.')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login Instrutor')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _cpfController,
//               decoration: InputDecoration(labelText: 'CPF'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Entrar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
