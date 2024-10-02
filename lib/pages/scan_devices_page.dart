import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanDevicesPage extends StatefulWidget {
  @override
  _ScanDevicesPageState createState() => _ScanDevicesPageState();
}

class _ScanDevicesPageState extends State<ScanDevicesPage> {
  List<BluetoothDevice> devicesList = [];
  bool isScanning = false;
  BluetoothDevice? selectedDevice;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    // Solicita as permissões Bluetooth e Localização
    var status = await Permission.bluetooth.status;
    if (!status.isGranted) {
      await Permission.bluetooth.request();
    }

    var locationStatus = await Permission.location.status;
    if (!locationStatus.isGranted) {
      await Permission.location.request();
    }

    var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    if (!bluetoothConnectStatus.isGranted) {
      await Permission.bluetoothConnect.request();
    }

    var bluetoothScanStatus = await Permission.bluetoothScan.status;
    if (!bluetoothScanStatus.isGranted) {
      await Permission.bluetoothScan.request();
    }

    // Após as permissões serem concedidas, começa a buscar os dispositivos
    if (status.isGranted && locationStatus.isGranted && bluetoothConnectStatus.isGranted && bluetoothScanStatus.isGranted) {
      _startScan();
    } else {
      print("Permissões necessárias não concedidas.");
    }
  }

  Future<void> _startScan() async {
    setState(() {
      isScanning = true;
    });

    // Buscar dispositivos emparelhados
    List<BluetoothDevice> bondedDevices = await FlutterBluetoothSerial.instance.getBondedDevices();

    // Escanear novos dispositivos
    FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      final BluetoothDevice device = r.device;

      // Adicionar dispositivo à lista se não estiver presente
      if (!devicesList.any((d) => d.address == device.address)) {
        setState(() {
          devicesList.add(device);
        });
      }
    }).onDone(() {
      setState(() {
        isScanning = false;
      });
    });

    // Adicionar dispositivos emparelhados à lista
    setState(() {
      devicesList.addAll(bondedDevices);
    });
  }

  void _selectDevice(BluetoothDevice device) {
    setState(() {
      selectedDevice = device;
    });
    Navigator.pop(context, device); // Retorna o dispositivo selecionado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar JDY-31'),
      ),
      body: isScanning
          ? Center(
              child: CircularProgressIndicator(),
            )
          : devicesList.isEmpty
              ? Center(
                  child: Text('Nenhum dispositivo encontrado.'),
                )
              : ListView.builder(
                  itemCount: devicesList.length,
                  itemBuilder: (context, index) {
                    BluetoothDevice device = devicesList[index];
                    return ListTile(
                      title: Text(device.name ?? "Dispositivo desconhecido"),
                      subtitle: Text(device.address),
                      onTap: () => _selectDevice(device),
                      trailing: device == selectedDevice
                          ? Icon(Icons.check, color: Colors.green)
                          : null,
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startScan,
        child: Icon(Icons.search),
        tooltip: 'Buscar Dispositivos',
      ),
    );
  }
}
