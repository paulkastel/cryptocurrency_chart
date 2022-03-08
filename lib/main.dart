import 'package:cryptochart/crypto_chart_app.dart';
import 'package:cryptochart/utils/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

void main() {
  EquatableConfig.stringify = true;
  setupServiceLocator();
  runApp(const CryptoChartApp());
}
