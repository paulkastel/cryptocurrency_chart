import 'package:cryptochart/models/pair_model.dart';
import 'package:cryptochart/network/crypto_rest_api.dart';
import 'package:cryptochart/network/dtos/dataset_dto.dart';

class CryptoRepository {
  CryptoRepository(this._api);

  final CryptoRestApi _api;

  Future<DatasetDto> getLast2Weeks(PairModel pair) {
    return _api.getDaily(pair.base.code, pair.counter.code, 14);
  }

  Future<DatasetDto> getLastHour(PairModel pair) {
    return _api.getMinutely(pair.base.code, pair.counter.code);
  }

  Future<DatasetDto> getLast3Days(PairModel pair) {
    return _api.getHourly(pair.base.code, pair.counter.code);
  }
}
