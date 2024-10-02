import 'package:dio/dio.dart';
import '../models/aula.dart';

class ApiService {
  Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
  ));

  Future<List<Aula>> getAulasDoDia(String cpf) async {
    try {
      Response response = await _dio.get('/aulas', queryParameters: {'cpf': cpf});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Aula.fromJson(json)).toList();
      } else {
        throw Exception('Erro ao buscar aulas: Código ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Falha ao carregar aulas: $e');
    }
  }
}
