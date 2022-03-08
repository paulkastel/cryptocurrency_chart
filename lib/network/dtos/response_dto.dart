import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:equatable/equatable.dart';

class ResponseDto extends Equatable {
  const ResponseDto(this.data, this.message, this.type);

  factory ResponseDto.fromMap(Map<String, dynamic> map) {
    return ResponseDto(
      DatasetDto.fromMap(map['Data'] as Map<String, dynamic>),
      map['Message'] as String,
      map['Type'] as int,
    );
  }

  /// This object contains the full data set as well as some general information about that data set.
  final DatasetDto data;

  /// This returns details about any errors that may have occurred.
  final String message;

  /// Message type 100 indicates success, anything else indicates an error.
  final int type;

  @override
  List<Object?> get props => [data, message, type];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Data': data.toMap(),
      'Type': type,
      'Message': message,
    };
  }
}
