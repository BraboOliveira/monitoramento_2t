import 'package:mobx/mobx.dart';
import 'package:monitoramento_2t/services/bluetooth_service.dart';


part 'bluetooth_store.g.dart';  // Gera o arquivo .g.dart automaticamente

class BluetoothStore = _BluetoothStore with _$BluetoothStore;

abstract class _BluetoothStore with Store {
  final BluetoothService _bluetoothService = BluetoothService();

  @observable
  ObservableList<String> logs = ObservableList<String>();  // Logs do Bluetooth

  @observable
  bool isConnected = false;  // Estado da conexão Bluetooth

@action
Future<void> connectToDevice(String address) async {
  try {
    await _bluetoothService.connect(address);
    isConnected = _bluetoothService.isDeviceConnected();
    if (isConnected) {
      _startListeningToData();  // Certifique-se de iniciar a escuta após conectar
    }
  } catch (e) {
    print('Erro ao conectar: $e');
    throw Exception('Erro na conexão');
  }
}

@action
void _startListeningToData() {
  // Escuta os dados do Bluetooth se a conexão estiver ativa
  _bluetoothService.listenToData()?.listen((data) {
    String receivedData = String.fromCharCodes(data);
    logs.add(receivedData);  // Atualiza os logs
    print('Dados recebidos: $receivedData');
  }, onError: (error) {
    print('Erro ao receber dados: $error');
    // _reconnect();  // Tenta reconectar se houver erro
  });
}


  // @action
  // Future<void> _reconnect() async {
  //   if (!_bluetoothService.isDeviceConnected()) {
  //     print('Tentando reconectar automaticamente...');
  //     await _bluetoothService.reconnect(_bluetoothService.getConnectedDeviceAddress()!);
  //   }
  // }

  @action
  void disconnect() {
    _bluetoothService.disconnect();
    isConnected = false;
  }
}
