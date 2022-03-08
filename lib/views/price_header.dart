import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/network/dtos/data_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceHeader extends StatelessWidget {
  const PriceHeader(this.data, {Key? key}) : super(key: key);

  final DataDto data;

  String _getCurrentPrice() {
    final quote = NumberFormat.simpleCurrency(name: ChartCubit.pair.counter.code).format(data.open);
    return '1 ${ChartCubit.pair.base.name}: $quote';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        _getCurrentPrice(),
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
