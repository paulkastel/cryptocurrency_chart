import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/utils/locator.dart';
import 'package:cryptochart/views/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoChartApp extends StatelessWidget {
  const CryptoChartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency Chart',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: BlocProvider(
        create: (context) => locator.get<ChartCubit>()..getChartFor(ChartPeriod.week),
        child: const ChartPage(),
      ),
    );
  }
}
