// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BluetoothController on _BluetoothController, Store {
  late final _$devicesAtom =
      Atom(name: '_BluetoothController.devices', context: context);

  @override
  ObservableList<BluetoothDevice> get devices {
    _$devicesAtom.reportRead();
    return super.devices;
  }

  @override
  set devices(ObservableList<BluetoothDevice> value) {
    _$devicesAtom.reportWrite(value, super.devices, () {
      super.devices = value;
    });
  }

  late final _$logsAtom =
      Atom(name: '_BluetoothController.logs', context: context);

  @override
  ObservableList<String> get logs {
    _$logsAtom.reportRead();
    return super.logs;
  }

  @override
  set logs(ObservableList<String> value) {
    _$logsAtom.reportWrite(value, super.logs, () {
      super.logs = value;
    });
  }

  late final _$selectedDeviceAddressAtom = Atom(
      name: '_BluetoothController.selectedDeviceAddress', context: context);

  @override
  String get selectedDeviceAddress {
    _$selectedDeviceAddressAtom.reportRead();
    return super.selectedDeviceAddress;
  }

  @override
  set selectedDeviceAddress(String value) {
    _$selectedDeviceAddressAtom.reportWrite(value, super.selectedDeviceAddress,
        () {
      super.selectedDeviceAddress = value;
    });
  }

  late final _$isConnectedAtom =
      Atom(name: '_BluetoothController.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$getPairedDevicesAsyncAction =
      AsyncAction('_BluetoothController.getPairedDevices', context: context);

  @override
  Future<void> getPairedDevices() {
    return _$getPairedDevicesAsyncAction.run(() => super.getPairedDevices());
  }

  late final _$connectToDeviceAsyncAction =
      AsyncAction('_BluetoothController.connectToDevice', context: context);

  @override
  Future<void> connectToDevice() {
    return _$connectToDeviceAsyncAction.run(() => super.connectToDevice());
  }

  late final _$_reconnectAsyncAction =
      AsyncAction('_BluetoothController._reconnect', context: context);

  @override
  Future<void> _reconnect() {
    return _$_reconnectAsyncAction.run(() => super._reconnect());
  }

  late final _$_BluetoothControllerActionController =
      ActionController(name: '_BluetoothController', context: context);

  @override
  void setSelectedDevice(String address) {
    final _$actionInfo = _$_BluetoothControllerActionController.startAction(
        name: '_BluetoothController.setSelectedDevice');
    try {
      return super.setSelectedDevice(address);
    } finally {
      _$_BluetoothControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _startListeningToData() {
    final _$actionInfo = _$_BluetoothControllerActionController.startAction(
        name: '_BluetoothController._startListeningToData');
    try {
      return super._startListeningToData();
    } finally {
      _$_BluetoothControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disconnect() {
    final _$actionInfo = _$_BluetoothControllerActionController.startAction(
        name: '_BluetoothController.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_BluetoothControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
devices: ${devices},
logs: ${logs},
selectedDeviceAddress: ${selectedDeviceAddress},
isConnected: ${isConnected}
    ''';
  }
}
