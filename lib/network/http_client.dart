import 'package:dio/dio.dart';

final httpClient = Dio(BaseOptions(baseUrl: 'https://min-api.cryptocompare.com/data/v2'))
  ..interceptors.add(
    LogInterceptor(
      request: false,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
    ),
  );
