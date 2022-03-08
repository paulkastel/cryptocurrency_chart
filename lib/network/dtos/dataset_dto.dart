import 'package:cryptochart/network/dtos/data_dto.dart';
import 'package:equatable/equatable.dart';

class DatasetDto extends Equatable {
  const DatasetDto(
    this.data,
    this.timeFrom,
    this.timeTo, {
    required this.aggregated,
  });

  factory DatasetDto.fromMap(Map<String, dynamic> map) {
    return DatasetDto(
      List<DataDto>.from(
        (map['Data'] as List)
            .map((dynamic d) => DataDto.fromMap(d as Map<String, dynamic>))
            .toList(),
      ),
      DateTime.fromMillisecondsSinceEpoch((map['TimeFrom'] as int) * 1000, isUtc: true),
      DateTime.fromMillisecondsSinceEpoch((map['TimeTo'] as int) * 1000, isUtc: true),
      aggregated: map['Aggregated'] as bool,
    );
  }

  /// Whether or not each data point represents an aggregation of multiple days.
  final bool aggregated;

  /// An array of objects, each containing price and volume data of the requested pair
  /// for the specified time period (as dictated by the ‘aggregate’ parameter).
  final List<DataDto> data;

  /// The unix timestamp for the start of this data set.
  final DateTime timeFrom;

  /// The unix timestamp for the end of this data set.
  final DateTime timeTo;

  @override
  List<Object?> get props => [aggregated, data, timeFrom, timeTo];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aggregated': aggregated,
      'data': data.map((d) => d.toMap()).toList(),
      'timeFrom': timeFrom.millisecondsSinceEpoch,
      'timeTo': timeTo.millisecondsSinceEpoch,
    };
  }
}
