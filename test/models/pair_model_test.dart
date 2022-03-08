import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/models/currency_model.dart';
import 'package:cryptochart/models/pair_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should compare pairs', () {
    final pair = PairModel(CurrencyModel.btc(), CurrencyModel.usd());
    expect(ChartCubit.pair, pair);
  });
}
