import 'package:cryptochart/network/dtos/data_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final actual = DataDto.fromMap(
    const <String, dynamic>{
      'time': 1645142400,
      'high': 0.00002532,
      'low': 0.0000244,
      'open': 0.00002466,
      'volumefrom': 1308787736.51,
      'volumeto': 32514.79,
      'close': 0.000025,
      'conversionType': 'invert',
      'conversionSymbol': ''
    },
  );

  final expected = DataDto(
    0.000025,
    0.00002532,
    0.0000244,
    0.00002466,
    DateTime.fromMillisecondsSinceEpoch(1645142400 * 1000, isUtc: true),
    1308787736.51,
    32514.79,
  );

  test('should create and compare $DataDto', () {
    expect(actual.toMap(), expected.toMap());
    expect(actual, expected);
  });
}
