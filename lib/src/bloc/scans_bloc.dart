import 'dart:async';

import 'package:scanner_qr_skinnet/src/providers/db_provider.dart';


class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener Scans de la base de datos
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scanStreamController.stream;

  dispose() {
    _scanStreamController?.close();
  }
}