import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:scanner_qr_skinnet/src/models/scan_model.dart';

class MapaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location), 
            onPressed: () {}
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 10
      ),
      layers: [
        _crearMapa(),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accesToken}',
      additionalOptions: {
        'accesToken': 'pk.eyJ1IjoiaHJ1bm5lcjc2IiwiYSI6ImNrOHFsN2VpdDAxcWwzZnF1bXIwYmVjNngifQ.VGmUBEr8HSWD10adq77vIA',
        'id': 'mapbox.streets' //street, dark, light, outdoors, satellite
      }

    );
  }
}