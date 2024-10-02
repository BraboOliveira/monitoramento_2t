import 'package:mobx/mobx.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:monitoramento_2t/services/bluetooth_service.dart';


part 'bluetooth_controller.g.dart';  // Gera o código automaticamente

class BluetoothController = _BluetoothController with _$BluetoothController;

abstract class _BluetoothController with Store {
  final BluetoothService _bluetoothService = BluetoothService();

  @observable
  ObservableList<BluetoothDevice> devices = ObservableList<BluetoothDevice>(); // Dispositivos pareados

  @observable
  ObservableList<String> logs = ObservableList<String>();  // Logs recebidos

  @observable
  String selectedDeviceAddress = '';  // Endereço do dispositivo selecionado

  @observable
  bool isConnected = false;  // Estado da conexão

  @action
  Future<void> getPairedDevices() async {
    devices.clear();
    devices.addAll(await _bluetoothService.getBondedDevices());
  }

  @action
  void setSelectedDevice(String address) {
    selectedDeviceAddress = address;
  }

  @action
  Future<void> connectToDevice() async {
    if (selectedDeviceAddress.isNotEmpty) {
      await _bluetoothService.connect(selectedDeviceAddress);
      isConnected = _bluetoothService.isDeviceConnected();
      if (isConnected) {
        _startListeningToData();
      }
    }
  }

  @action
  void _startListeningToData() {
    _bluetoothService.listenToData()?.listen((data) {
      logs.add(String.fromCharCodes(data));
    });
  }

  @action
  void disconnect() {
    _bluetoothService.disconnect();
    isConnected = false;
  }
}
