import 'package:equatable/equatable.dart';

class DataDto extends Equatable {
  const DataDto(
    this.close,
    this.high,
    this.low,
    this.open,
    this.time,
    this.volumeFrom,
    this.volumeTo,
  );

  factory DataDto.fromMap(Map<String, dynamic> map) {
    return DataDto(
      map['close'] as num,
      map['high'] as num,
      map['low'] as num,
      map['open'] as num,
      DateTime.fromMillisecondsSinceEpoch((map['time'] as int) * 1000, isUtc: true),
      map['volumefrom'] as num,
      map['volumeto'] as num,
    );
  }

  /// The price of the requested pair at the end of this period of time.
  final num close;

  /// The highest price of the requested pair during this period of time.
  final num high;

  /// The lowest price of the requested pair during this period of time.
  final num low;

  /// The price of the requested pair at the start of this period of time.
  final num open;

  /// The unix timestamp for the start of this data point.
  final DateTime time;

  /// The total amount of the base currency traded into the quote currency
  /// during this period of time (in units of the base currency).
  final num volumeFrom;

  /// The total amount of the quote currency traded into the base currency
  /// during this period of time (in units of the quote currency).
  final num volumeTo;

  @override
  List<Object?> get props => [close, high, low, open, time, volumeFrom, volumeTo];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'close': close,
      'high': high,
      'low': low,
      'open': open,
      'time': time.millisecondsSinceEpoch,
      'volumeFrom': volumeFrom,
      'volumeTo': volumeTo,
    };
  }
}
