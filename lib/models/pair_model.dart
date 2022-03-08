import 'package:cryptochart/models/currency_model.dart';
import 'package:equatable/equatable.dart';

class PairModel extends Equatable {
  const PairModel(this.base, this.counter);

  final CurrencyModel base;
  final CurrencyModel counter;

  @override
  List<Object?> get props => [counter, base];
}
