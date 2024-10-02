import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? connection;
  bool isConnected = false;
  String? _connectedDeviceAddress;

  // Método para obter dispositivos Bluetooth pareados
  Future<List<BluetoothDevice>> getBondedDevices() async {
    try {
      // Pega a lista de dispositivos já pareados
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
      _connectedDeviceAddress = address;
      print('Conectado ao dispositivo $address');

      // Escutar eventos de desconexão e tentar reconectar
      connection!.input?.listen(null).onDone(() {
        print('Conexão perdida com $address');
        isConnected = false;
        _tryReconnect();
      });
    } catch (e) {
      isConnected = false;
      print('Erro ao conectar: $e');
      throw Exception('Erro ao conectar ao dispositivo Bluetooth');
    }
  }

  Future<void> _tryReconnect() async {
    if (_connectedDeviceAddress != null && !isConnected) {
      print('Tentando reconectar automaticamente...');
      await connect(_connectedDeviceAddress!);
    }
  }

Stream<List<int>>? listenToData() {
  if (connection != null && isConnected) {
    // Converta o input stream em um broadcast stream para permitir múltiplos ouvintes
    return connection!.input?.asBroadcastStream();
  }
  return null;
}


  Future<void> disconnect() async {
    if (connection != null && isConnected) {
      await connection!.close();
      isConnected = false;
      _connectedDeviceAddress = null;
      print('Dispositivo desconectado');
    }
  }

  String? getConnectedDeviceAddress() {
    return _connectedDeviceAddress;
  }

  bool isDeviceConnected() {
    return isConnected;
  }
}
  