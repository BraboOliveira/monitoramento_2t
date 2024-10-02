import 'package:flutter/material.dart';
import 'package:monitoramento_2t/models/aula.dart';
import 'package:monitoramento_2t/models/car_status.dart';
import 'package:monitoramento_2t/services/api_service.dart';
import 'package:monitoramento_2t/services/bluetooth_service.dart';


class AppController {
  final ApiService _apiService = ApiService();
  final BluetoothService _bluetoothService = BluetoothService();

  // Gerencia a autenticação e busca as aulas do dia
  Future<List<Aula>> loginAndFetchAulas(String cpf) async {
    try {
      List<Aula> aulas = await _apiService.getAulasDoDia(cpf);
      return aulas;
    } catch (e) {
      throw Exception('Erro ao buscar aulas: $e');
    }
  }

  // Gerencia a conexão Bluetooth e escuta os dados do carro
  Future<CarStatus?> connectAndMonitorBluetooth(String deviceAddress) async {
    try {
      await _bluetoothService.connect(deviceAddress);
      if (_bluetoothService.isDeviceConnected()) {
        CarStatus? carStatus;
        _bluetoothService.listenToData()?.listen((List<int> data) {
          String receivedData = String.fromCharCodes(data);
          carStatus = CarStatus.fromJson(receivedData as Map<String, dynamic>);  // Atualiza o status do carro
        });
        return carStatus;
      } else {
        throw Exception('Dispositivo não conectado');
      }
    } catch (e) {
      throw Exception('Erro ao conectar ao Bluetooth: $e');
    }
  }

  // Método para desconectar o Bluetooth
  void disconnectBluetooth() {
    _bluetoothService.disconnect();
  }
}
