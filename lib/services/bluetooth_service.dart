import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? connection;
  bool isConnected = false;
  String? _connectedDeviceAddress;  // Armazenar o endereço do dispositivo conectado

  Future<List<BluetoothDevice>> getBondedDevices() async {
    try {
      List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance.getBondedDevices();
      return devices;
    } catch (e) {
      print('Erro ao buscar dispositivos pareados: $e');
      throw Exception('Erro ao buscar dispositivos Bluetooth');
    }
  }

  Future<void> connect(String address) async {
    try {
      connection = await BluetoothConnection.toAddress(address);
      isConnected = true;
      _connectedDeviceAddress = address;  // Armazenar o endereço do dispositivo conectado
      print('Conectado ao dispositivo $address');
    } catch (e) {
      isConnected = false;
      print('Erro ao conectar: $e');
      throw Exception('Erro ao conectar ao dispositivo Bluetooth');
    }
  }

  Stream<List<int>>? listenToData() {
    return connection?.input;
  }

  Future<void> disconnect() async {
    if (connection != null && isConnected) {
      await connection!.close();
      isConnected = false;
      _connectedDeviceAddress = null;  // Limpa o endereço do dispositivo desconectado
      print('Dispositivo desconectado');
    }
  }

  // Método para retornar o endereço do dispositivo conectado
  String? getConnectedDeviceAddress() {
    return _connectedDeviceAddress;
  }

  bool isDeviceConnected() {
    return isConnected;
  }

  Future<void> reconnect() async {
    if (_connectedDeviceAddress != null && !isConnected) {
      print('Tentando reconectar ao dispositivo $_connectedDeviceAddress...');
      await connect(_connectedDeviceAddress!);
    } else {
      print('Nenhum dispositivo armazenado para reconectar');
    }
  }
}
