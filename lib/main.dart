import 'package:cryptochart/chart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoChartApp());
}

class CryptoChartApp extends StatelessWidget {
  const CryptoChartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency Chart',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChartPage(),
    );
  }
}
