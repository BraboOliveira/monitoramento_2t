import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Importa o Observer do MobX
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:monitoramento_2t/models/controllers/bluetooth_controller.dart';

class MonitoramentoPage extends StatefulWidget {
  @override
  _MonitoramentoPageState createState() => _MonitoramentoPageState();
}

class _MonitoramentoPageState extends State<MonitoramentoPage> {
  final BluetoothController _bluetoothController = BluetoothController();

  @override
  void initState() {
    super.initState();
    _fetchBondedDevices();
  }

  Future<void> _fetchBondedDevices() async {
    try {
      await _bluetoothController.getPairedDevices(); // Assumindo que este método atualiza o observable
    } catch (e) {
      print('Erro ao buscar dispositivos: $e');
      _showSnackbar('Erro ao buscar dispositivos');
    }
  }

Future<void> _connectToDevice() async {
  if (_bluetoothController.selectedDeviceAddress.isNotEmpty) {
    try {
      await _bluetoothController.connectToDevice();
      _showSnackbar('Conectado ao dispositivo');
    } catch (e) {
      print('Erro ao conectar: $e');
      _showSnackbar('Erro ao conectar ao dispositivo');
    }
  }
}

void _showSnackbar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void _notifyReconnection() {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reconectando...')));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento Bluetooth'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(
              builder: (_) => DropdownButton<String>(
                value: _bluetoothController.selectedDeviceAddress.isEmpty
                    ? null
                    : _bluetoothController.selectedDeviceAddress,
                hint: Text('Selecione um dispositivo'),
                items: _bluetoothController.devices.map((device) {
                  return DropdownMenuItem(
                    value: device.address,
                    child: Text(device.name ?? 'Dispositivo Desconhecido'),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  _bluetoothController.setSelectedDevice(newValue!); // Usar MobX action
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _connectToDevice,
              child: Text('Conectar'),
            ),
            SizedBox(height: 20),
            // Área de logs com rolagem e bordas arredondadas
            Expanded(
              child: Observer(
                builder: (_) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.blueAccent, width: 2.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: _bluetoothController.logs.isNotEmpty
                      ? ListView.builder(
                          itemCount: _bluetoothController.logs.length,
                          itemBuilder: (context, index) {
                            return Text(
                              _bluetoothController.logs[index],
                              style: TextStyle(fontSize: 12),
                            );
                          },
                        )
                      : Center(child: Text('Nenhum dado recebido ainda.')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bluetoothController.disconnect();
    super.dispose();
  }
}
