import 'package:flutter/material.dart';

import 'package:scanner_qr_skinnet/src/pages/home_page.dart';
import 'package:scanner_qr_skinnet/src/pages/mapa_page.dart';

void main() => runApp(ScannerQR());

class ScannerQR extends StatelessWidget {
  const ScannerQR({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeQR',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaPage()
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(249, 185, 0, 1.0)
      ),
    );
  }
}