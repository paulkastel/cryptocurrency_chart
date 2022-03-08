import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:cryptochart/network/dtos/response_dto.dart';
import 'package:dio/dio.dart';

/// [Api Documentation](https://min-api.cryptocompare.com/documentation?key=Historical&cat=dataHistoday)
class CryptoRestApi {
  CryptoRestApi(this._client);

  final Dio _client;
  final _tag = '$CryptoRestApi';

  /// [tokenSymbol] - The cryptocurrency symbol of interest
  /// [fiatSymbol] - The currency symbol to convert into
  /// [days] - The number of data points to return; max: 2000
  Future<DatasetDto> getDaily(String tokenSymbol, String fiatSymbol, [int days = 7]) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/histoday?fsym=$tokenSymbol&tsym=$fiatSymbol&limit=$days&toTs=-1',
      );

      final dto = ResponseDto.fromMap(response.data!);
      if (dto.type != 100) {
        throw HttpException(dto.message, uri: response.requestOptions.uri);
      } else {
        return dto.data;
      }
    } on DioError catch (ex, stack) {
      log('Connection failed!', name: _tag, error: ex, stackTrace: stack);
      throw TimeoutException('Connection failed!');
    }
  }

  /// [tokenSymbol] - The cryptocurrency symbol of interest
  /// [fiatSymbol] - The currency symbol to convert into
  /// [hours] - The number of data points to return; max: 2000
  Future<DatasetDto> getHourly(String tokenSymbol, String fiatSymbol, [int hours = 72]) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/histohour?fsym=$tokenSymbol&tsym=$fiatSymbol&limit=$hours&toTs=-1',
      );

      final dto = ResponseDto.fromMap(response.data!);
      if (dto.type != 100) {
        throw HttpException(dto.message, uri: response.requestOptions.uri);
      } else {
        return dto.data;
      }
    } on DioError catch (ex, stack) {
      log('Connection failed!', name: _tag, error: ex, stackTrace: stack);
      throw TimeoutException('Connection failed!');
    }
  }

  /// [tokenSymbol] - The cryptocurrency symbol of interest
  /// [fiatSymbol] - The currency symbol to convert into
  /// [minutes] - The number of data points to return; max: 2000
  Future<DatasetDto> getMinutely(String tokenSymbol, String fiatSymbol, [int minutes = 60]) async {
    try {
      final response = await _client.get<Map<String, dynamic>>(
        '/histominute?fsym=$tokenSymbol&tsym=$fiatSymbol&limit=$minutes&toTs=-1',
      );

      final dto = ResponseDto.fromMap(response.data!);
      if (dto.type != 100) {
        throw HttpException(dto.message, uri: response.requestOptions.uri);
      } else {
        return dto.data;
      }
    } on DioError catch (ex, stack) {
      log('Connection failed!', name: _tag, error: ex, stackTrace: stack);
      throw TimeoutException('Connection failed!');
    }
  }
}
