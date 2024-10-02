import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:monitoramento_2t/services/bluetooth_service.dart';

part 'bluetooth_controller.g.dart';

class BluetoothController = _BluetoothController with _$BluetoothController;

abstract class _BluetoothController with Store {
  final BluetoothService _bluetoothService = BluetoothService();

  @observable
  ObservableList<BluetoothDevice> devices = ObservableList<BluetoothDevice>();

  @observable
  ObservableList<String> logs = ObservableList<String>();

  @observable
  String selectedDeviceAddress = '';

  @observable
  bool isConnected = false;

  StreamSubscription<List<int>>? _dataSubscription;

  @action
  Future<void> getPairedDevices() async {
    devices.clear();
    try {
      devices.addAll(await _bluetoothService.getBondedDevices());
    } catch (e) {
      print('Erro ao buscar dispositivos pareados: $e');
    }
  }

  @action
  void setSelectedDevice(String address) {
    selectedDeviceAddress = address;
  }

  @action
  Future<void> connectToDevice() async {
    if (selectedDeviceAddress.isNotEmpty) {
      try {
        await _bluetoothService.connect(selectedDeviceAddress);
        isConnected = _bluetoothService.isDeviceConnected();
        if (isConnected) {
          _startListeningToData();  // Inicia a escuta de dados
        }
      } catch (e) {
        print('Erro ao conectar: $e');
        throw Exception('Erro ao conectar ao dispositivo Bluetooth');
      }
    }
  }
@action
void _startListeningToData() {
  // Cancela a assinatura anterior, se houver, para evitar múltiplas assinaturas
  _dataSubscription?.cancel();

  // Inicia a escuta dos dados
  _dataSubscription = _bluetoothService.listenToData()?.listen((data) {
    logs.add(String.fromCharCodes(data));  // Adiciona os dados recebidos aos logs
  }, onError: (error) {
    print('Erro ao receber dados: $error');
    _reconnect();  // Tenta reconectar se houver erro
  });
}

@action
Future<void> _reconnect() async {
  // Verifica se há um dispositivo armazenado e tenta reconectar
  if (selectedDeviceAddress.isNotEmpty && !isConnected) {
    print('Tentando reconectar ao dispositivo $selectedDeviceAddress...');
    await connectToDevice();
  }
}

@action
void disconnect() {
  // Cancela a assinatura do stream e desconecta o dispositivo
  _dataSubscription?.cancel();
  _bluetoothService.disconnect();
  isConnected = false;
}

}
