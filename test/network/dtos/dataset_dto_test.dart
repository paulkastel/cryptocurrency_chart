import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final actual = DatasetDto.fromMap(
    const <String, dynamic>{
      'Aggregated': false,
      'TimeFrom': 1645142400,
      'TimeTo': 1646352000,
      'Data': [
        {
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
        {
          'time': 1645228800,
          'high': 0.00002521,
          'low': 0.00002471,
          'open': 0.000025,
          'volumefrom': 467744109.72,
          'volumeto': 11674.81,
          'close': 0.00002493,
          'conversionType': 'invert',
          'conversionSymbol': ''
        },
      ]
    },
  );

  final expected = DatasetDto.fromMap(
    const <String, dynamic>{
      'Aggregated': false,
      'TimeFrom': 1645142400,
      'TimeTo': 1646352000,
      'Data': [
        {
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
        {
          'time': 1645228800,
          'high': 0.00002521,
          'low': 0.00002471,
          'open': 0.000025,
          'volumefrom': 467744109.72,
          'volumeto': 11674.81,
          'close': 0.00002493,
          'conversionType': 'invert',
          'conversionSymbol': ''
        },
      ]
    },
  );

  test('should create and compare $DatasetDto', () {
    expect(actual.toMap(), expected.toMap());
    expect(actual, expected);
  });
}
