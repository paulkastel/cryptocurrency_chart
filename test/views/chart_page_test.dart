import 'package:bloc_test/bloc_test.dart';
import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:cryptochart/utils/locator.dart';
import 'package:cryptochart/views/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ChartCubitMock extends MockCubit<ChartState> implements ChartCubit {}

void main() {
  late Widget testedWidget;

  setUpAll(() async {
    await locator.reset();
    locator.registerSingleton<ChartCubit>(ChartCubitMock());
  });

  setUp(() {
    testedWidget = BlocProvider(
      create: (context) => locator.get<ChartCubit>(),
      child: const MaterialApp(home: ChartPage()),
    );
  });

  testWidgets(
    'should find widgets when cubit state is $ChartInitial',
    (tester) async {
      when(() => locator.get<ChartCubit>().state).thenAnswer((_) => ChartInitial());
      await tester.pumpWidget(testedWidget);
      await tester.pump();

      //assert
      expect(find.byType(DefaultTabController), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'should find Center with error message when cubit state $ChartError',
    (tester) async {
      when(() => locator.get<ChartCubit>().state).thenAnswer((_) => const ChartError('Error!'));
      await tester.pumpWidget(testedWidget);
      await tester.pump();

      //assert
      expect(find.widgetWithText(Center, 'Error!'), findsOneWidget);
    },
  );

  testWidgets(
    'should find Center with error message when cubit state $ChartSuccess',
    (tester) async {
      final exampleDataset = DatasetDto.fromMap(
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

      when(() => locator.get<ChartCubit>().state).thenAnswer((_) => ChartSuccess(exampleDataset));
      await tester.pumpWidget(testedWidget);
      await tester.pump();

      //assert
      expect(find.byType(TabBarView), findsOneWidget);
    },
  );
}
