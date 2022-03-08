import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cryptochart/models/currency_model.dart';
import 'package:cryptochart/models/pair_model.dart';
import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:cryptochart/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit(this._repository) : super(ChartInitial());

  static final pair = PairModel(CurrencyModel.btc(), CurrencyModel.usd());

  final CryptoRepository _repository;

  Future<void> getChartFor(ChartPeriod period) async {
    try {
      emit(ChartLoading());
      final data = await _getData(period);
      return emit(ChartSuccess(data));
    } on HttpException catch (ex) {
      return emit(ChartError(ex.toString()));
    } on TimeoutException catch (ex) {
      return emit(ChartNetworkError(ex.toString()));
    }
  }

  Future<DatasetDto> _getData(ChartPeriod period) {
    switch (period) {
      case ChartPeriod.week:
        return _repository.getLast2Weeks(pair);
      case ChartPeriod.day:
        return _repository.getLast3Days(pair);
      case ChartPeriod.hour:
        return _repository.getLastHour(pair);
    }
  }
}

enum ChartPeriod { week, day, hour }
