// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BluetoothStore on _BluetoothStore, Store {
  late final _$logsAtom = Atom(name: '_BluetoothStore.logs', context: context);

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

  late final _$isConnectedAtom =
      Atom(name: '_BluetoothStore.isConnected', context: context);

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

  late final _$connectToDeviceAsyncAction =
      AsyncAction('_BluetoothStore.connectToDevice', context: context);

  @override
  Future<void> connectToDevice(String address) {
    return _$connectToDeviceAsyncAction
        .run(() => super.connectToDevice(address));
  }

  late final _$_BluetoothStoreActionController =
      ActionController(name: '_BluetoothStore', context: context);

  @override
  void _startListeningToData() {
    final _$actionInfo = _$_BluetoothStoreActionController.startAction(
        name: '_BluetoothStore._startListeningToData');
    try {
      return super._startListeningToData();
    } finally {
      _$_BluetoothStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disconnect() {
    final _$actionInfo = _$_BluetoothStoreActionController.startAction(
        name: '_BluetoothStore.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_BluetoothStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logs: ${logs},
isConnected: ${isConnected}
    ''';
  }
}
