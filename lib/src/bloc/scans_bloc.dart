import 'dart:async';

import 'package:scanner_qr_skinnet/src/bloc/validaciones.dart';
import 'package:scanner_qr_skinnet/src/providers/db_provider.dart';

class ScansBloc with Validacion {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener Scans de la base de datos
    obtenerScans();
  }

  final _scanStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scanStreamController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scanStreamController.stream.transform(validarHttp);

  dispose() {
    _scanStreamController?.close();
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  obtenerScans() async {
    _scanStreamController.sink.add(await DBProvider.db.getTodosScans());
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTodos() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }

}