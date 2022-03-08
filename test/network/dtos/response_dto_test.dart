import 'package:cryptochart/network/dtos/response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final actual = ResponseDto.fromMap(
    const <String, dynamic>{
      'Response': 'Success',
      'Message': '',
      'HasWarning': false,
      'Type': 100,
      'Data': {
        'Aggregated': false,
        'TimeFrom': 1646407200,
        'TimeTo': 1646410800,
        'Data': [
          {
            'time': 1646407200,
            'high': 0.00002462,
            'low': 0.0000246,
            'open': 0.00002461,
            'volumefrom': 1061291.97,
            'volumeto': 26.13,
            'close': 0.00002461,
            'conversionType': 'invert',
            'conversionSymbol': ''
          },
          {
            'time': 1646408460,
            'high': 0.0000245,
            'low': 0.00002449,
            'open': 0.00002449,
            'volumefrom': 489993.42,
            'volumeto': 12.01,
            'close': 0.0000245,
            'conversionType': 'invert',
            'conversionSymbol': ''
          }
        ]
      }
    },
  );

  final expected = ResponseDto.fromMap(
    const <String, dynamic>{
      'Response': 'Success',
      'Message': '',
      'HasWarning': false,
      'Type': 100,
      'Data': {
        'Aggregated': false,
        'TimeFrom': 1646407200,
        'TimeTo': 1646410800,
        'Data': [
          {
            'time': 1646407200,
            'high': 0.00002462,
            'low': 0.0000246,
            'open': 0.00002461,
            'volumefrom': 1061291.97,
            'volumeto': 26.13,
            'close': 0.00002461,
            'conversionType': 'invert',
            'conversionSymbol': ''
          },
          {
            'time': 1646408460,
            'high': 0.0000245,
            'low': 0.00002449,
            'open': 0.00002449,
            'volumefrom': 489993.42,
            'volumeto': 12.01,
            'close': 0.0000245,
            'conversionType': 'invert',
            'conversionSymbol': ''
          }
        ]
      }
    },
  );
  test('should create and compare $ResponseDto', () {
    expect(actual.toMap(), expected.toMap());
    expect(actual, expected);
  });
}
