import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/network/crypto_rest_api.dart';
import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:cryptochart/repositories/crypto_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoRestApiMock extends Mock implements CryptoRestApi {}

void main() {
  final apiMock = CryptoRestApiMock();
  final testedRepo = CryptoRepository(apiMock);

  final exampleData = DatasetDto(
    const [],
    DateTime(2022, 2, 25),
    DateTime(2022, 3, 4),
    aggregated: false,
  );

  test('should call api.getDaily when getLast2Weeks from repository is executed', () async {
    //arrange
    when(() => apiMock.getDaily('BTC', 'USD', 14)).thenAnswer((_) async => exampleData);

    //act
    final result = await testedRepo.getLast2Weeks(ChartCubit.pair);

    //assert
    expect(result, exampleData);
  });

  test('should call api.getHourly when getLast3Days from repository is executed', () async {
    //arrange
    when(() => apiMock.getHourly('BTC', 'USD')).thenAnswer((_) async => exampleData);
    final testedRepo = CryptoRepository(apiMock);

    //act
    final result = await testedRepo.getLast3Days(ChartCubit.pair);

    //assert
    expect(result, exampleData);
  });

  test('should call api.getHourly when getLast3Days from repository is executed', () async {
    //arrange
    when(() => apiMock.getMinutely('BTC', 'USD')).thenAnswer((_) async => exampleData);
    final testedRepo = CryptoRepository(apiMock);

    //act
    final result = await testedRepo.getLastHour(ChartCubit.pair);

    //assert
    expect(result, exampleData);
  });
}
