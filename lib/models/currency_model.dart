import 'package:equatable/equatable.dart';

class CurrencyModel extends Equatable {
  const CurrencyModel(this.code, this.name);

  factory CurrencyModel.btc() {
    return const CurrencyModel('BTC', 'Bitcoin');
  }

  factory CurrencyModel.doge() {
    return const CurrencyModel('DOGE', 'Dogecoin');
  }

  factory CurrencyModel.eth() {
    return const CurrencyModel('ETH', 'Ethereum');
  }

  factory CurrencyModel.eur() {
    return const CurrencyModel('EUR', 'Euro');
  }

  factory CurrencyModel.nok() {
    return const CurrencyModel('NOK', 'Norwegian Krone');
  }

  factory CurrencyModel.usd() {
    return const CurrencyModel('USD', 'US Dollar');
  }

  final String code;
  final String name;

  @override
  List<Object?> get props => [code, name];
}
