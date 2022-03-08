import 'package:cryptochart/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should compare currencies', () {
    expect(CurrencyModel.usd(), const CurrencyModel('USD', 'US Dollar'));
    expect(CurrencyModel.doge(), const CurrencyModel('DOGE', 'Dogecoin'));
    expect(CurrencyModel.eth(), const CurrencyModel('ETH', 'Ethereum'));
    expect(CurrencyModel.eur(), const CurrencyModel('EUR', 'Euro'));
    expect(CurrencyModel.nok(), const CurrencyModel('NOK', 'Norwegian Krone'));
  });
}
