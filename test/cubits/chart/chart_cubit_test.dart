import 'package:bloc_test/bloc_test.dart';
import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:cryptochart/repositories/crypto_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CryptoRepositoryMock extends Mock implements CryptoRepository {}

void main() {
  late ChartCubit testedCubit;
  final mockRepository = CryptoRepositoryMock();

  setUp(() {
    testedCubit = ChartCubit(mockRepository);
  });

  tearDown(() {
    testedCubit.close();
  });

  test('should emit initial state and do nothing when created', () {
    expect(testedCubit.state, isA<ChartInitial>());
    verifyZeroInteractions(mockRepository);
  });

  final exampleData = DatasetDto(
    const [],
    DateTime(2022, 2, 25),
    DateTime(2022, 3, 4),
    aggregated: false,
  );

  blocTest<ChartCubit, ChartState>(
    'should emit $ChartLoading and $ChartSuccess when ${ChartPeriod.week} is called',
    build: () {
      when(
        () => mockRepository.getLast2Weeks(ChartCubit.pair),
      ).thenAnswer((_) async => exampleData);
      return testedCubit;
    },
    act: (cubit) => cubit.getChartFor(ChartPeriod.week),
    expect: () => [ChartLoading(), ChartSuccess(exampleData)],
    verify: (cubit) {
      verify(() => mockRepository.getLast2Weeks(ChartCubit.pair)).called(1);
    },
  );

  blocTest<ChartCubit, ChartState>(
    'should emit $ChartLoading and $ChartSuccess when getChartFor with ${ChartPeriod.day} is called',
    build: () {
      when(() => mockRepository.getLast3Days(ChartCubit.pair)).thenAnswer((_) async => exampleData);
      return testedCubit;
    },
    act: (cubit) => cubit.getChartFor(ChartPeriod.day),
    expect: () => [ChartLoading(), ChartSuccess(exampleData)],
    verify: (cubit) {
      verify(() => mockRepository.getLast3Days(ChartCubit.pair)).called(1);
    },
  );

  blocTest<ChartCubit, ChartState>(
    'should emit $ChartLoading and $ChartSuccess when ${ChartPeriod.hour} is called',
    build: () {
      when(() => mockRepository.getLastHour(ChartCubit.pair)).thenAnswer((_) async => exampleData);
      return testedCubit;
    },
    act: (cubit) => cubit.getChartFor(ChartPeriod.hour),
    expect: () => [ChartLoading(), ChartSuccess(exampleData)],
    verify: (cubit) {
      verify(() => mockRepository.getLastHour(ChartCubit.pair)).called(1);
    },
  );

  blocTest<ChartCubit, ChartState>(
    'should emit $ChartLoading and $ChartError when repository throws exception',
    build: () {
      when(() => mockRepository.getLastHour(ChartCubit.pair)).thenThrow(Exception('Error!'));
      return testedCubit;
    },
    act: (cubit) => cubit.getChartFor(ChartPeriod.hour),
    expect: () => [ChartLoading(), ChartError(Exception('Error!').toString())],
    verify: (cubit) {
      verify(() => mockRepository.getLastHour(ChartCubit.pair)).called(1);
    },
  );
}
